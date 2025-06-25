Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A7AE8F45
	for <lists+samba-technical@lfdr.de>; Wed, 25 Jun 2025 22:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4d9eApCSSyTMpsriaBERHWJd5ehcOhQ7ctWFZ18Hr7E=; b=YOSDdpkjgQ9qxOY/G0pIYNtyXT
	yCFgckAS0HCtKMPLeOywWOz2C/MeXB102RMnkYAvptrrca1MMjxDAxS060gBmdo4tqn9SRXwLwFO3
	kLKQ2ZYxOhTl/s812TS98V1kvn6n9qs0uIgdTetaV+eHP/KmZ0Sn9McSYUera29u3u2fb8PXPR0ZI
	DDmXxgl9Vzug6d/vfK9VaoepP7pNXdoq1lnJTEpMtq4dEf95WjFBR411SYQzxZm1db6Db0jU1FSZe
	qUOO4TEC7+++73rIjbypsWbZSWvvKIYENps123FwtOGeDAr3mMHWpYfab8xFgDVic+vzm5eJtnrAL
	u14YoY8Q==;
Received: from ip6-localhost ([::1]:44848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uUWUJ-007rBE-LI; Wed, 25 Jun 2025 20:12:55 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:60482) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uUT77-007qQw-L0
 for samba-technical@lists.samba.org; Wed, 25 Jun 2025 16:36:48 +0000
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6ecf99dd567so1635626d6.0
 for <samba-technical@lists.samba.org>; Wed, 25 Jun 2025 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750869404; x=1751474204; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4d9eApCSSyTMpsriaBERHWJd5ehcOhQ7ctWFZ18Hr7E=;
 b=CimsaH3i+el7vhpTpLl8EHalM6gvOvSK0CsxyTGpixBhDDjE09OgBKsmArkLjrJBO9
 la492B2y89bEmbX6nYAPLD+6xu97LRpXhWRiPWD7oQ5cRPJ3Oed/Dahw/fMDZvoQ5VxS
 Awkf4bOB1Ow4uR5pAjtUh/Rrf7uAQcytqfl0zLDFEuTT1JRvpApKf9FAK0GqIJTciVi5
 o1mOfpz9zV0kTxRdBMey9iU6KBIUa2eEgeJ81dLTizwLLnsoenia6sSbhwQjWnsgcNnr
 tW7BUMDx72LQQZGY9P2/hzqk54I+f0dDk4r3i75SwO3Zfh1K+f0ugBBEK7DI/7oMpbWF
 Jj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750869404; x=1751474204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4d9eApCSSyTMpsriaBERHWJd5ehcOhQ7ctWFZ18Hr7E=;
 b=i62viNta3tqT9l2V9cthqFdtxTOiRJklVsbiTRNI2zOlqgnVck9YeAyaay2skpgTBy
 VSZur1pWE6hU/KR2n4oqRazt7b3yKGPK5fxdUHY84jhVjfDzp07J01boa4RSZ0Gk+GCi
 j75v/ugvrrlXOjAQJnMMDZlUOybA/aTSTi9jsolwtmP2qMSvR03QYbCHOrq4SwIBxYKq
 KBnqU50/VFFn5hDnH8Aim5EiOg0XBb8P6gNTUz8Ih4NdcFeyaAHA+dfyndFSFNyCPMw2
 sB4ErKEqye7kFJJ53yVaUBuu4GzUDQPijyPYJiykYzruFR5bS0suZ2kbv0uEIq1s6qYs
 U3uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuhdFotA0wVF+Yes5n4eDzvXhbFnsA+3m7INCRhpMSLrF7qsAZSA9GVUuYUiqS2jrSRxIFq3ON4XnqqPmSmEA=@lists.samba.org
X-Gm-Message-State: AOJu0YzC7Gy63MC66+PTOFc4+d60ZSIpZjATz6bclt3SNScAw8KMAtTC
 mPHHo/oVy9xBtyGFSmCNZ7A2WjK/Wkp0phpWE/N6lo+uOegD+54jg1z+LsMYAs8v3BIbjEbJ5Ul
 Ij/QKtKOlwurxcpqJ3XLOHmWFkSBwKnc=
X-Gm-Gg: ASbGncsATCJh1iob/Q/aV+z7hNg7lvxatHuR5QJFyEWd2hnjjdc7pJrbBUiWyic9WkQ
 SwsNvJnTwe1DOqWSiBcUQbVtTtsBOc1OswFOf1u01+p04pjMl28SF71Rh5SbrbThcdYudu0mJrS
 vetTNoSLxosE8QZ9Mgzk0EWIFOHZi0gWUSCMhXoRjokOroXWjKAWin51Txs6quk23Dmozt7uO2R
 PA/
X-Google-Smtp-Source: AGHT+IEk46fsNFposX423Xj2Z+1uZPrg6VxLruQLBSrEiFJLXmPSmYqDqtmOXEgpHTb3w5yESy0n+EU6eN/yGGGIa18=
X-Received: by 2002:a05:6214:21ef:b0:6fa:c6e6:11f9 with SMTP id
 6a1803df08f44-6fd5ef63fc4mr50324086d6.11.1750869403480; Wed, 25 Jun 2025
 09:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250625081304.943870-1-metze@samba.org>
In-Reply-To: <20250625081304.943870-1-metze@samba.org>
Date: Wed, 25 Jun 2025 11:36:32 -0500
X-Gm-Features: Ac12FXxJPsW3fhoWlvY2DNNrJGlkQXu3lWP0Kd-NJ0k1OK9ZSs6jde4_rsqeWg8
Message-ID: <CAH2r5mvewQhsrpVaj=2oyTjNT1WWTGr0FoN6PikKOqUqi5MCHw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: remove \t from TP_printk statements
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 stable@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Jun 25, 2025 at 3:13=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> The generate '[FAILED TO PARSE]' strings in trace-cmd report output like =
this:
>
>   rm-5298  [001]  6084.533748493: smb3_exit_err:        [FAILED TO PARSE]=
 xid=3D972 func_name=3Dcifs_rmdir rc=3D-39
>   rm-5298  [001]  6084.533959234: smb3_enter:           [FAILED TO PARSE]=
 xid=3D973 func_name=3Dcifs_closedir
>   rm-5298  [001]  6084.533967630: smb3_close_enter:     [FAILED TO PARSE]=
 xid=3D973 fid=3D94489281833 tid=3D1 sesid=3D96758029877361
>   rm-5298  [001]  6084.534004008: smb3_cmd_enter:       [FAILED TO PARSE]=
 tid=3D1 sesid=3D96758029877361 cmd=3D6 mid=3D566
>   rm-5298  [001]  6084.552248232: smb3_cmd_done:        [FAILED TO PARSE]=
 tid=3D1 sesid=3D96758029877361 cmd=3D6 mid=3D566
>   rm-5298  [001]  6084.552280542: smb3_close_done:      [FAILED TO PARSE]=
 xid=3D973 fid=3D94489281833 tid=3D1 sesid=3D96758029877361
>   rm-5298  [001]  6084.552316034: smb3_exit_done:       [FAILED TO PARSE]=
 xid=3D973 func_name=3Dcifs_closedir
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>  fs/smb/client/trace.h | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/fs/smb/client/trace.h b/fs/smb/client/trace.h
> index 52bcb55d9952..93e5b2bb9f28 100644
> --- a/fs/smb/client/trace.h
> +++ b/fs/smb/client/trace.h
> @@ -140,7 +140,7 @@ DECLARE_EVENT_CLASS(smb3_rw_err_class,
>                 __entry->len =3D len;
>                 __entry->rc =3D rc;
>         ),
> -       TP_printk("\tR=3D%08x[%x] xid=3D%u sid=3D0x%llx tid=3D0x%x fid=3D=
0x%llx offset=3D0x%llx len=3D0x%x rc=3D%d",
> +       TP_printk("R=3D%08x[%x] xid=3D%u sid=3D0x%llx tid=3D0x%x fid=3D0x=
%llx offset=3D0x%llx len=3D0x%x rc=3D%d",
>                   __entry->rreq_debug_id, __entry->rreq_debug_index,
>                   __entry->xid, __entry->sesid, __entry->tid, __entry->fi=
d,
>                   __entry->offset, __entry->len, __entry->rc)
> @@ -190,7 +190,7 @@ DECLARE_EVENT_CLASS(smb3_other_err_class,
>                 __entry->len =3D len;
>                 __entry->rc =3D rc;
>         ),
> -       TP_printk("\txid=3D%u sid=3D0x%llx tid=3D0x%x fid=3D0x%llx offset=
=3D0x%llx len=3D0x%x rc=3D%d",
> +       TP_printk("xid=3D%u sid=3D0x%llx tid=3D0x%x fid=3D0x%llx offset=
=3D0x%llx len=3D0x%x rc=3D%d",
>                 __entry->xid, __entry->sesid, __entry->tid, __entry->fid,
>                 __entry->offset, __entry->len, __entry->rc)
>  )
> @@ -247,7 +247,7 @@ DECLARE_EVENT_CLASS(smb3_copy_range_err_class,
>                 __entry->len =3D len;
>                 __entry->rc =3D rc;
>         ),
> -       TP_printk("\txid=3D%u sid=3D0x%llx tid=3D0x%x source fid=3D0x%llx=
 source offset=3D0x%llx target fid=3D0x%llx target offset=3D0x%llx len=3D0x=
%x rc=3D%d",
> +       TP_printk("xid=3D%u sid=3D0x%llx tid=3D0x%x source fid=3D0x%llx s=
ource offset=3D0x%llx target fid=3D0x%llx target offset=3D0x%llx len=3D0x%x=
 rc=3D%d",
>                 __entry->xid, __entry->sesid, __entry->tid, __entry->targ=
et_fid,
>                 __entry->src_offset, __entry->target_fid, __entry->target=
_offset, __entry->len, __entry->rc)
>  )
> @@ -298,7 +298,7 @@ DECLARE_EVENT_CLASS(smb3_copy_range_done_class,
>                 __entry->target_offset =3D target_offset;
>                 __entry->len =3D len;
>         ),
> -       TP_printk("\txid=3D%u sid=3D0x%llx tid=3D0x%x source fid=3D0x%llx=
 source offset=3D0x%llx target fid=3D0x%llx target offset=3D0x%llx len=3D0x=
%x",
> +       TP_printk("xid=3D%u sid=3D0x%llx tid=3D0x%x source fid=3D0x%llx s=
ource offset=3D0x%llx target fid=3D0x%llx target offset=3D0x%llx len=3D0x%x=
",
>                 __entry->xid, __entry->sesid, __entry->tid, __entry->targ=
et_fid,
>                 __entry->src_offset, __entry->target_fid, __entry->target=
_offset, __entry->len)
>  )
> @@ -482,7 +482,7 @@ DECLARE_EVENT_CLASS(smb3_fd_class,
>                 __entry->tid =3D tid;
>                 __entry->sesid =3D sesid;
>         ),
> -       TP_printk("\txid=3D%u sid=3D0x%llx tid=3D0x%x fid=3D0x%llx",
> +       TP_printk("xid=3D%u sid=3D0x%llx tid=3D0x%x fid=3D0x%llx",
>                 __entry->xid, __entry->sesid, __entry->tid, __entry->fid)
>  )
>
> @@ -521,7 +521,7 @@ DECLARE_EVENT_CLASS(smb3_fd_err_class,
>                 __entry->sesid =3D sesid;
>                 __entry->rc =3D rc;
>         ),
> -       TP_printk("\txid=3D%u sid=3D0x%llx tid=3D0x%x fid=3D0x%llx rc=3D%=
d",
> +       TP_printk("xid=3D%u sid=3D0x%llx tid=3D0x%x fid=3D0x%llx rc=3D%d"=
,
>                 __entry->xid, __entry->sesid, __entry->tid, __entry->fid,
>                 __entry->rc)
>  )
> @@ -794,7 +794,7 @@ DECLARE_EVENT_CLASS(smb3_cmd_err_class,
>                 __entry->status =3D status;
>                 __entry->rc =3D rc;
>         ),
> -       TP_printk("\tsid=3D0x%llx tid=3D0x%x cmd=3D%u mid=3D%llu status=
=3D0x%x rc=3D%d",
> +       TP_printk("sid=3D0x%llx tid=3D0x%x cmd=3D%u mid=3D%llu status=3D0=
x%x rc=3D%d",
>                 __entry->sesid, __entry->tid, __entry->cmd, __entry->mid,
>                 __entry->status, __entry->rc)
>  )
> @@ -829,7 +829,7 @@ DECLARE_EVENT_CLASS(smb3_cmd_done_class,
>                 __entry->cmd =3D cmd;
>                 __entry->mid =3D mid;
>         ),
> -       TP_printk("\tsid=3D0x%llx tid=3D0x%x cmd=3D%u mid=3D%llu",
> +       TP_printk("sid=3D0x%llx tid=3D0x%x cmd=3D%u mid=3D%llu",
>                 __entry->sesid, __entry->tid,
>                 __entry->cmd, __entry->mid)
>  )
> @@ -867,7 +867,7 @@ DECLARE_EVENT_CLASS(smb3_mid_class,
>                 __entry->when_sent =3D when_sent;
>                 __entry->when_received =3D when_received;
>         ),
> -       TP_printk("\tcmd=3D%u mid=3D%llu pid=3D%u, when_sent=3D%lu when_r=
cv=3D%lu",
> +       TP_printk("cmd=3D%u mid=3D%llu pid=3D%u, when_sent=3D%lu when_rcv=
=3D%lu",
>                 __entry->cmd, __entry->mid, __entry->pid, __entry->when_s=
ent,
>                 __entry->when_received)
>  )
> @@ -898,7 +898,7 @@ DECLARE_EVENT_CLASS(smb3_exit_err_class,
>                 __assign_str(func_name);
>                 __entry->rc =3D rc;
>         ),
> -       TP_printk("\t%s: xid=3D%u rc=3D%d",
> +       TP_printk("%s: xid=3D%u rc=3D%d",
>                 __get_str(func_name), __entry->xid, __entry->rc)
>  )
>
> @@ -924,7 +924,7 @@ DECLARE_EVENT_CLASS(smb3_sync_err_class,
>                 __entry->ino =3D ino;
>                 __entry->rc =3D rc;
>         ),
> -       TP_printk("\tino=3D%lu rc=3D%d",
> +       TP_printk("ino=3D%lu rc=3D%d",
>                 __entry->ino, __entry->rc)
>  )
>
> @@ -950,7 +950,7 @@ DECLARE_EVENT_CLASS(smb3_enter_exit_class,
>                 __entry->xid =3D xid;
>                 __assign_str(func_name);
>         ),
> -       TP_printk("\t%s: xid=3D%u",
> +       TP_printk("%s: xid=3D%u",
>                 __get_str(func_name), __entry->xid)
>  )
>
> --
> 2.34.1
>
>


--=20
Thanks,

Steve

