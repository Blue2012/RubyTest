class LessonController < ApplicationController
    def step1
        render plain: "こんにちは、#{params[:name]}さん"
    end
    def step2
        render plain: params[:controller] + "#" + params[:action]
    end
    def step3
        render plain: request.remote_ip
    end
    def step4
        render plain: request.headers["User-Agent"]
    end
    def step5
        redirect_to action: "step6"
    end
    def step6
        render plain: "Step6に移動しました"
    end
    def step7
        flash[:notice] = "Step8へ移動します"
        redirect_to action: "step8"
    end
    def step8
        render plain: flash[:notice]
    end
    def create
        unless @member.save
            flash.now[:error] = "保存に失敗しました。"
            render "new"
        end 
    end
end
