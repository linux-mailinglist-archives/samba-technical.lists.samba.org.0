Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D735790148
	for <lists+samba-technical@lfdr.de>; Fri,  1 Sep 2023 19:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=XTpZX1v9zFCHygg0zJKR0XY3X0zEVJeHDiVBElxXcEw=; b=j+h+qOEzlx9WRKsc2s1E2AlT7y
	eqeI0UfwqQfpEhY2jzMThO0SDUoWjl34DxRH2B/7fT2uBwzz7V17EIH7vOFrqFeF9eGRG6umDG0r3
	xfSKfrVa0M9StpR0KPdUsng8srqBmuQdQwAN/YDM5rLrBdXuAk8nRvBhyj82i0JCoZVD+C0VrLoZf
	Zt1qxfW+UO26wkYNNBa7seiBXSZkR3uA+EOzs6tlESqcQ6DjDAM765uMc5Cyw1/Q4aNNeGZtnvsGv
	dsHdEmvcjbsRt0VvaorByPTo9TopR5lNR4bbq247M78gFwj+uB3BKSLduuTIwGxIQTbA2BAc/1jBH
	lVKazrHg==;
Received: from ip6-localhost ([::1]:22296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qc7nH-0009ty-Io; Fri, 01 Sep 2023 17:18:51 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:54750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qc7nA-0009tp-2G
 for samba-technical@lists.samba.org; Fri, 01 Sep 2023 17:18:48 +0000
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1cc61f514baso1408574fac.1
 for <samba-technical@lists.samba.org>; Fri, 01 Sep 2023 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693588719; x=1694193519; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTpZX1v9zFCHygg0zJKR0XY3X0zEVJeHDiVBElxXcEw=;
 b=o0In5Yq0XCVDthh0Nt4s+RTSw8CIMWbkzlRGoeLTK00qyY+GzQtjWoIUg7pTEw78x5
 Iv3V+Xh0pbBdxNTmhdy1Fzx9ac03zAxqYds8abg2R2xpqECO0igZz/rqX5OyVYnzudAI
 chakmHOEjFl6z5ukYsP0NDLHmHSu1MZzeaoff8rhQX1LjW6hoiA0zOIQCStRoPQh8zip
 dy/JLEl8HfBEOheVsu7Ye8rgEWCGRXcRlOxXXDjh5W9f2ugyhEXf7QJRyKBzu87rd0DZ
 l24i9L15eYoS3wHNLLGQiqJiNU4LnF6juzvNYGcUG73+4PLRDKH5XfmawsCXrarkRPTN
 kpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693588719; x=1694193519;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTpZX1v9zFCHygg0zJKR0XY3X0zEVJeHDiVBElxXcEw=;
 b=No1sSmqfgDhBpAr3pKmraWyr1OuTKQ5OgGWmGQO9bq5SRe/j+htfEEmfr9pzshMelq
 WH98LB7HnGVQWcbsoE0rmM+yjh4c+IOgLL3h7Ie3APKNxwy5GpgKuFdm8ESvDQf81eKk
 BNJmgmwactSAVBohHRiFS6DhL+b3h2lI/CycTSkeLJpY6CjcFXkRT6C4y5y/FnDsCtMA
 NnEWbj9r+nPHg1he1uw/Q4z5WRSYy10nBCiMXrRg0t8WcJct1zF6hnuFlaPBmQBdx0LW
 or3EMNe4hY6rSPuNTeiIQzfAmqHPc2GWZmhcVfAdTyABzP7TEmGGmDxQVxVf9bMGeroK
 nXaQ==
X-Gm-Message-State: AOJu0YwtyWv1NGgs/1ABe0jxLM88rEibg5+7QJ0l3xgp/J6NX1+aT8iF
 i6mLO2hZMh5TgkVAnuC89iC9ap+atHoPJXrUpEOs+s+LLlE=
X-Google-Smtp-Source: AGHT+IGDU6Pdwg+h4WvB0aKe22hXYGqUi4Rv8jlEP6ILjCjBLKvHkx1atp6IIrjpfDypyCqbbYPUWVAdyvn/X+2yRm4=
X-Received: by 2002:a05:6870:41d3:b0:1d0:d357:c526 with SMTP id
 z19-20020a05687041d300b001d0d357c526mr3414183oac.11.1693588719648; Fri, 01
 Sep 2023 10:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPx2amrwUZRYoMZOu+XGshLCRQtEDGsx_dfVVoLVP=VTbw@mail.gmail.com>
 <ZPIZij6tviIwnAP+@jeremy-acer>
In-Reply-To: <ZPIZij6tviIwnAP+@jeremy-acer>
Date: Fri, 1 Sep 2023 10:15:22 -0700
Message-ID: <CACyXjPyFJ3qTGRrHZOi8Gqn-R5j0mq61HG2exFQFQZyDfbikPQ@mail.gmail.com>
Subject: Re: One simple stupid users trick owns all your bases ...
To: Jeremy Allison <jra@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 1, 2023 at 10:04=E2=80=AFAM Jeremy Allison <jra@samba.org> wrot=
e:
>
> On Fri, Sep 01, 2023 at 09:21:09AM -0700, Richard Sharpe via samba-techni=
cal wrote:
> >Hi folks,
> >
> >I didn't follow the instructions carefully enough.
> >
> >I set up resolv.conf to point at 127.0.0.1 and an upstream nameserver
> >(10.20.1.100).
> >
> >During provisioning that created an entry of 'dns resolver =3D 127.0.0.1=
'.
> >
> >That resulted in the following crash. Looks like a bug.
> >
> >Provisioning should not use any of the aliases for the current system
> >as forwarders.
> >
> >In addition, perhaps the code should not crash if it gets a timeout.
> >
> >4.19.0rc4.
>
> Can you add a "panic action =3D /bin/sleep 99999999"
> and catch it in gdb. Knowing *exactly* what line
> it goes down on will help. A lot :-).

OK:

#0  0x00007fa0f256dd98 in nanosleep () from /lib64/libc.so.6
#1  0x00007fa0f256dc9e in sleep () from /lib64/libc.so.6
#2  0x00007fa0f8e1c13b in log_stack_trace () at ../../lib/util/fault.c:306
#3  0x00007fa0f8e1c33f in smb_panic_log (
    why=3Dwhy@entry=3D0x7ffc3acd6050 "Signal 11: Segmentation fault")
    at ../../lib/util/fault.c:195
#4  0x00007fa0f8e1c4b3 in smb_panic (
    why=3Dwhy@entry=3D0x7ffc3acd6050 "Signal 11: Segmentation fault")
    at ../../lib/util/fault.c:206
#5  0x00007fa0f8e1c619 in fault_report (sig=3D11) at ../../lib/util/fault.c=
:83
#6  sig_fault (sig=3D11) at ../../lib/util/fault.c:94
#7  <signal handler called>
#8  0x00007fa0f7b90049 in dns_cli_request_udp_done (subreq=3D<optimized out=
>)
    at ../../libcli/dns/dns.c:497
#9  0x00007fa0f7b9134d in dns_udp_request_done (subreq=3D0x618001b18900)
    at ../../libcli/dns/dns.c:157
#10 0x00007fa0f9764929 in tdgram_recvfrom_done (subreq=3D0x61800533cd00)
    at ../../lib/tsocket/tsocket.c:239
#11 0x00007fa0f976b1f7 in tdgram_bsd_recvfrom_handler (
    private_data=3D<optimized out>) at ../../lib/tsocket/tsocket_bsd.c:1186
#12 0x00007fa0f9769c18 in tdgram_bsd_fde_handler (ev=3D<optimized out>,
    fde=3D<optimized out>, flags=3D<optimized out>, private_data=3D<optimiz=
ed out>)
    at ../../lib/tsocket/tsocket_bsd.c:910
#13 0x00007fa0f3dc53a7 in tevent_common_invoke_fd_handler ()

Here is the code:

(gdb) frame 8
#8  0x00007fa0f7b90049 in dns_cli_request_udp_done (subreq=3D<optimized out=
>)
    at ../../libcli/dns/dns.c:497
497                     tevent_req_error(req, ENOMSG);
(gdb) list
492
493             reply_id =3D PULL_BE_U16(reply.data, 0);
494             if (reply_id !=3D state->req_id) {
495                     DBG_DEBUG("Got id %"PRIu16", expected %"PRIu16"\n",
496                               state->reply->id, state->req_id);
497                     tevent_req_error(req, ENOMSG);
498                     return;
499             }
500
501             operation =3D PULL_BE_U16(reply.data, 2);

I still think provision should not allow this but it should also not crash.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

