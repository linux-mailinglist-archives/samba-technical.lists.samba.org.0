Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704C6DAB4B
	for <lists+samba-technical@lfdr.de>; Fri,  7 Apr 2023 12:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0Dh6ojJ1aLo61oAOPLHDys23msr377LbLwQmvUkIACk=; b=LuTqkHniDRZFa5jA/Y9LsatPq6
	cYGfqTXBidBVjGWnP2nqS5kVOIIws6dUe+yX998UR97WRDwfFY5PA4QLEYpmQj6Cbb0Jw7L1F0dwq
	MGJLGrScC6labnsuqZ4iGp9637O9lYpA+QAPWYAV6y8Bty3h6BL6A1Qnygrs3XtCpgFhJVg8yYCjI
	0lHybNYaPPM4xOs+dV84sYtVlkU/0qSODzWezgwMJTGfcTPOqlhkSy44frqzBOvqjvB2Jpwl27Id0
	cKfcH4vKbcUfAIhjefzkHbQ3LGQb6crbFi8Oio3bhfRCPft2XSTD4RoagqifkrIz+uQt+sXitDczl
	r0hG/CJQ==;
Received: from ip6-localhost ([::1]:44010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pkj6s-009qYv-2z; Fri, 07 Apr 2023 10:14:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33340) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pkj6n-009qYm-Gs
 for samba-technical@lists.samba.org; Fri, 07 Apr 2023 10:14:19 +0000
Received: by mail-ej1-x635.google.com with SMTP id 11so7385093ejw.0
 for <samba-technical@lists.samba.org>; Fri, 07 Apr 2023 03:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680862456; x=1683454456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0Dh6ojJ1aLo61oAOPLHDys23msr377LbLwQmvUkIACk=;
 b=OOnBrmgkvKwMuPxuUzXeqTI54QW/7T3fDO1aYHt+nWr3jp6FFfynu1F8Jh6kNwQsmK
 gF7cKLFDajyULHAmxiFB94h50n4oRXZJYKrhPS4SKgOsUw63SN3Wuz86CbccpA13O4qC
 +YZEH/Bdw8vEpdi4MTcYSa5DrnUrBhfBB4rg+g5dQJZ6Iu2paM1f7uGI/oxqb8ZY2X3a
 RNs0xqmvLHyubMv4+1XYl5DVz5fbwJqCfH4Q0bXU79PlDcPhNIXG5reRxpBZcbhb8fM7
 bZ0NTrwR7lUQdBy5OGVLxWYOB3SvcOyzH7ieOSR9iGweOVecG00o2Zwiw1i8oOLBuj+u
 EXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680862456; x=1683454456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Dh6ojJ1aLo61oAOPLHDys23msr377LbLwQmvUkIACk=;
 b=315BC/TNPMH80QY9V5PxcC2kXavAIqRxyktoD/8+Bjfm6Xfw5pqrwcCVA5B4Y7l3lJ
 6mVVCPHzgWGoUMiwDtR90kUN6znWkIcOtzD8SJbANWuYF/1Nw2q9APM3xKweGD9dGCA1
 GwndVlvtUCsr3LXVHBTbDlE4kHdZmEKNDnBZ15mdrkC1AWlqBJHAwMq3M61pJ1q5zeFt
 Pr7FMbUKOk5oACsM71okMuWJm7GarDMmELHrTHm5rLKHmNFwQckni9GWJ+Bpg/wbYrZ9
 UR1mWIzCkqZ4p+6U/Oj83mkoBjLhFsOkWVtJFR66FFj0N9eIZyLDpwMrFCRc4T1nT617
 F16Q==
X-Gm-Message-State: AAQBX9fICBI/K9+v1sl4J9oyd2En5w//+zoOrWL3lg8yQi+9MB1gfd1N
 azC+WB++9ZKwIos5rFNyEL84jTJEHFWA4wcpp1o=
X-Google-Smtp-Source: AKy350bbs3q+gqoTfvRGsZnf3KurJm+o/nwFKA8YK2UQxqR9LJdFgwOnS+HXqWQYQOA/e80ID2sew9Pq3HRs2NLXSBg=
X-Received: by 2002:a17:906:802:b0:8b1:3298:c587 with SMTP id
 e2-20020a170906080200b008b13298c587mr911297ejd.2.1680862456649; Fri, 07 Apr
 2023 03:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <1efcd842-b6a3-353a-0bf9-3ebf890eb712@redhat.com>
In-Reply-To: <1efcd842-b6a3-353a-0bf9-3ebf890eb712@redhat.com>
Date: Fri, 7 Apr 2023 20:14:04 +1000
Message-ID: <CAN05THRJb_4edm9Hne1yY3D6VvtQ=CbYn+KhVy7Xw=i4GE-c+w@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: reinstate original behavior again for
 forceuid/forcegid
To: Takayuki Nagata <tnagata@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: tom@talpey.com, sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 pc@cjr.nz, samba-technical@lists.samba.org, lsahlber@redhat.com,
 sfrench@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks good.
The question arises, are there any situations where forceuid is
meaningful without uid= argument and what would it mean?

On Fri, 7 Apr 2023 at 15:09, Takayuki Nagata <tnagata@redhat.com> wrote:
>
> forceuid/forcegid should be enabled by default when uid=/gid= options are
> specified, but commit 24e0a1eff9e2 ("cifs: switch to new mount api")
> changed the behavior. Due to the change, a mounted share does not show
> intentional uid/gid for files and directories even though uid=/gid=
> options are specified since forceuid/forcegid are not enabled.
>
> This patch reinstates original behavior that overrides uid/gid with
> specified uid/gid by the options.
>
> Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Takayuki Nagata <tnagata@redhat.com>
> Acked-by: Ronnie Sahlberg <lsahlber@redhat.com>
> Acked-by: Tom Talpey <tom@talpey.com>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> ---
> V1 -> V2: Revised commit message to clarify "what breaks".
>
>  fs/cifs/fs_context.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> index ace11a1a7c8a..6f7c5ca3764f 100644
> --- a/fs/cifs/fs_context.c
> +++ b/fs/cifs/fs_context.c
> @@ -972,6 +972,7 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
>                         goto cifs_parse_mount_err;
>                 ctx->linux_uid = uid;
>                 ctx->uid_specified = true;
> +               ctx->override_uid = 1;
>                 break;
>         case Opt_cruid:
>                 uid = make_kuid(current_user_ns(), result.uint_32);
> @@ -1000,6 +1001,7 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
>                         goto cifs_parse_mount_err;
>                 ctx->linux_gid = gid;
>                 ctx->gid_specified = true;
> +               ctx->override_gid = 1;
>                 break;
>         case Opt_port:
>                 ctx->port = result.uint_32;
> --
> 2.40.0
>

