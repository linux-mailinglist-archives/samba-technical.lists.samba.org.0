Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 24783B2B37D
	for <lists+samba-technical@lfdr.de>; Mon, 18 Aug 2025 23:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=G5mC/vEOmShR27O6wi76fydoZyaSh4/O0s70DRwKZfc=; b=ooDziihqHyY8+RoaDzTJeUolfI
	N8BP3vaVYyOSBJBaHjlHrPToav/kbmBk1dsBsXT86z6ftfX24X6hf/AlqHM816hqyA2EUYH74dCPx
	D4s737Z2h+vktgYuQD6pPWB0y3koa0kibDDW/NE9CcMbb3Mg9GGKCY5xJM8Zk1KCMxw2AelPXHqPq
	2G3XOMschoaMnYmky+jmqTQkICzbp1Jbhes/SVZ+OIwI8EPQA//lD6JL+HaOBRLHsJjpuKsSjqiSw
	xDHZwm2LtaRiWjfKcQgfSQvHft6cYDWM+Y72bQNmGcVt+Lf4CN/3YIw/LM3WRs54kvLt2yHbatqF1
	vWtLjgZQ==;
Received: from ip6-localhost ([::1]:40980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uo7WW-00FH4o-Vz; Mon, 18 Aug 2025 21:36:13 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:45504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uo7WS-00FH4h-He
 for samba-technical@lists.samba.org; Mon, 18 Aug 2025 21:36:11 +0000
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7e8706856e0so487209085a.3
 for <samba-technical@lists.samba.org>; Mon, 18 Aug 2025 14:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755552966; x=1756157766; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5mC/vEOmShR27O6wi76fydoZyaSh4/O0s70DRwKZfc=;
 b=SPq4KsAroQUxZa8wCze471RBL43/KXtoM7cfznasScfMFGFxS+FWBOGVMdGsf/LQ2M
 Btoch55TAPMhj7fVB1C2uiNeL2efwy9xiRb4PFPK2zFgHs805glpVNgXpgvJ7hbnxb6A
 NET7jQ/oFLSJn9rFGnhdY+YNq4u7Ph2e1YyP9lV8+TBmBRaurh9XbWI+nJ0HaUXKtcdd
 lrItaYZ0IWvTmGvLODnZe3UV3FsbuSEu7jkUtUs/nJdct01tpriqMWudlyckZxbwPZyz
 zzhw10+XsLQw+QRcnUW7q50VL7K8Fdn6Qu/0wPaPZ4pHL4x3XYM2Ht0Vaf6sNL7dC70D
 CMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755552966; x=1756157766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5mC/vEOmShR27O6wi76fydoZyaSh4/O0s70DRwKZfc=;
 b=Y2nqJ/SS9Ym5G1boz6MV22DuzJmwllLK+djbZUKS+6YFE79XsXvg/Oh8OAwIfJ4tPS
 3N6oSonWtMZz7C1pP41mVpl++5iKHXxg3PmiEaetAr5gUXKSb7nRFcLNsjNsR+LqC/0+
 MQGy3S47CxOjWMaD5RDvE4jtmopDWYDizSN/zWlrAluBiu7IqPF2CPZhptad0rR+c53F
 aKiNdy4hot7l1GUAQRkGv3FbT4fBwxi6nBbpsuxQBENm7G86bCLv2PgvojclLxvEG4ou
 X4XhWae93VrcjvwspPPPgxiG0K90YsFHoSRbLwoUGYSCccJaKXhUaBv5BYKTPWQ7H0Yd
 oE+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJGXVfEwMowStZYstDMsL68F63OnpOgNHdrQCHmgD4jQ1ntpozCPcl+Ixs/8BE5uqo4Pa4VuHXs3uty98f5EI=@lists.samba.org
X-Gm-Message-State: AOJu0YzY2lZ+6Kr8rno8YeFgEf/dX4w2WBrh7w+qvZWiLeTcfZCnv83Q
 7i8H+MjvbzTm6AjYbrnRiLUzImhSbcGIOuYvLuj1sZ9Sg25P/2XHFJfa4+OvsFxDn8QbxJ468LH
 zR/z0iF8hB9almwyV2GcAkXEvxlNeBLaVZQ==
X-Gm-Gg: ASbGnctE5Kz1gnByz0aLHUDeT7jFjKIb9fdTz5CFbokDJ7pAzWGL5vhblijxY1C7Ybb
 5WlehtaKueOZNfHERAn4L3ObQ+R6jIIoQxeyDJ2w0u9xOAV5AoLVzGVlszm7+bk/LeAWR7fSrVQ
 qfbd09kJ1WZX1eus0j60sLJy16TLBzpjCU369438fzyQBXoNKmwG2mzZK+3C2B2s9fkQawtdbKY
 5WeUJZ1NPuhIv0/5z1Lfaid0p5igLwXqoBzdGaYTLzCdWnXGbc=
X-Google-Smtp-Source: AGHT+IFCD3fWR6YXHpR5xA57y6bIdD9fhdz9RgOmb8Z6skSFYDLwFSNjuIkAJ87UjM5aKAWJSNhWFgEp2B4u2BOAPCw=
X-Received: by 2002:a05:620a:4611:b0:7e3:495a:2982 with SMTP id
 af79cd13be357-7e9f3203f7fmr63800285a.0.1755552966242; Mon, 18 Aug 2025
 14:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <05881546-b505-4c0e-8d95-ee1c24f01fc8@samba.org>
In-Reply-To: <05881546-b505-4c0e-8d95-ee1c24f01fc8@samba.org>
Date: Mon, 18 Aug 2025 16:35:54 -0500
X-Gm-Features: Ac12FXzK3WWfQv2gjrTiA0fcG00Vz4ufIVuhRMAmLI28fp22yC7mEdm-rlI9xWE
Message-ID: <CAH2r5mtkB_Tbb4Pzba_msMfPs-Tz3ff4udKBRiR1d=f0TTC-PQ@mail.gmail.com>
Subject: Re: Common smbdirect debugging/loggin/tracing...
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
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 18, 2025 at 3:31=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi,
>
> after the move to common smbdirect structures I'm wondering
> what I have to keep related to the debug counters on the
> client side, e.g.
>
>          /* for debug purposes */
>          unsigned int count_get_receive_buffer;
>          unsigned int count_put_receive_buffer;
>          unsigned int count_reassembly_queue;
>          unsigned int count_enqueue_reassembly_queue;
>          unsigned int count_dequeue_reassembly_queue;
>          unsigned int count_send_empty;
>
> And the their use (and more) in cifs_debug_data_proc_show().
>
> I'd suggest to remove this stuff and later add some tracepoints
> instead or if really needed some stuff under smbdirect_socket.statistics.

I lean toward keeping the smbdirect debug info that is already shown
in /proc/fs/cifs/DebugData,
it doesn't have a performance penalty, and "if it was useful before"
for debugging
to display smbdirect related info for a mount, it is it is likely
going to be useful in the future.
I don't mind changing this in the future, after there is more
information about what
additional smbdirect info would be most useful to add to display for
the client mounts.

> Also do we need to keep the log_rdma() based message in the client
> and the ksmbd_debug(RDMA) messages on the server as is?
> I guess we want some basic logging for the connect/disconnect handling
> and the rest should be tracepoints...

I am not a big fan of old style (static) kernel debug messages but it
is probably fine to keep
the existing ones (unless code changes that would remove a few of them,
that is fine), but typically the only ones that are 'required' are
cases that are always on
logged (for connection errors e.g. that the user needs the additional
info in dmesg to understand).

And yes, the majority of logging should be eBPF friendly dynamic
tracepoints (Meetakshi may
have some ideas on tooling that she can extend to make them easier to colle=
ct)

> Is something like logging module parameters and output
> written in stone or can this be changed to be more useful
> and in common between kernel client, kernel server and later
> userspace?

They can be changed (logging module parms) in this example, but I
wouldn't be in a huge
hurry to ditch it, since there are VERY likely things that are client
specific logging
for smbdirect that we would not want to to turn on for both client and serv=
er.



--=20
Thanks,

Steve

