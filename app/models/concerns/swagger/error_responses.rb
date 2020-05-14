Module  Swagger :: ErrorResponses
  Module  NotFoundError
    Def  Self . Extended ( Base )
      Base . Response  404  Do
        Key  : Description ,  'Resource Not Found'
        Schema  Do
          Key  : '$ Ref' ,  : ErrorOutput  # see the error which is separately defined
        End
      End
    End
  End

  # ...
end
