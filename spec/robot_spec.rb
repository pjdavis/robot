require "robot"

RSpec.describe Robot do

  context "initialization" do

    it "starts with a speed of zero" do
      robot = Robot.new
      expect(robot.speed).to eq 0
    end

    it "starts with a direction of none" do
      robot = Robot.new
      expect(robot.direction).to eq("none")
    end
  end

  context "instructions" do

    context "at rest" do

      it "sets direction to the given direction" do
        robot = Robot.new
        robot.instruct("Forward")
        expect(robot.direction).to eq("Forward")
      end

      it "sets speed to 1" do
        robot = Robot.new
        robot.instruct("Forward")
        expect(robot.speed).to eq(1)
      end
    end

    context "in motion" do

      context "instructions for the same direction" do
        before do
          @robot = Robot.new
          @robot.instruct("Forward")
        end

        it "increaces speed by 1" do
          @robot.instruct("Forward")
          expect(@robot.speed).to eq(2)
        end

        it "sets speed to 0 when reaching speed greater than 4" do
          @robot.instruct("Forward") #speed 2
          @robot.instruct("Forward") #speed 3
          @robot.instruct("Forward") #speed 4
          @robot.instruct("Forward") #speed 0
          expect(@robot.speed).to eq(0)
        end
      end

      context "moving in the opposite direction" do
        before(:each) do
          @robot = Robot.new
          @robot.instruct("Forward")
          @robot.instruct("Forward")
        end

        it "decreases speed by 1" do
          @robot.instruct("Backward")
          expect(@robot.speed).to eq(1)
        end

        it "keeps the same direction" do
          @robot.instruct("Backward")
          expect(@robot.direction).to eq("Forward")
        end
      end

      context "moving perpendicular" do
        before(:each) do
          @robot = Robot.new
          @robot.instruct("Forward")
          @robot.instruct("Forward")
        end

        it "changes direction" do
          @robot.instruct("Right")
          expect(@robot.direction).to eq("Right")
        end

        it "sets speed to 1" do
          @robot.instruct("Right")
          expect(@robot.speed).to eq(1)
        end
      end
    end
  end

end
