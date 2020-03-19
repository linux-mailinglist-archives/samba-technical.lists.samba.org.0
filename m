Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6F18AD07
	for <lists+samba-technical@lfdr.de>; Thu, 19 Mar 2020 07:53:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=U7lmoTXgZCNb4hRB+MtsTCJqwNoGrmUl99nw1wrxD04=; b=dvKh+WSE8yfhr6x4l6Y24NU/6V
	iYaxCUexp0iybke55zYATac8m8MMuiBG+kJWv/TEZacXTf/t+s4bhSxscjJiKdcBELFWnseiK1azO
	XdnMTHN7+nGQ2es+1CeFOhr/u2dD1JjvjUIxJpva92gBcTHbisSOQDYKiOLMpRXv9bdo7Ur7iJsvi
	DRPKP6PMB6Mv6sCC+n5nu+tn7jMNDYCxEJqi6fZ8y7jwsf/OVjBhBaZCFl9Rdj3fFV3b0CwVNnqSn
	KP2Hsvw/3aYXBpl3NfwUh0eemGBq5ZKU0mZt6uia2nvE6FL8eUpLe+ZMBlxtZCgWHNNvi2lhQoB2k
	rbSthXww==;
Received: from localhost ([::1]:38964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jEp3A-0008Bg-3A; Thu, 19 Mar 2020 06:53:04 +0000
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:48898) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jEp2s-0008BT-Rg
 for samba-technical@lists.samba.org; Thu, 19 Mar 2020 06:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584600763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSNnz5LPhL1QWpnPRLlnDwjE0ea393ZwkaNMqe9hZys=;
 b=h0Ol3FPn+SV/x8Hq5krgTI7rnD8e81OfEvrkkaf101/isBgwlNJrjF1m4/xGkwXc3mXfhA
 0ssJd0buwg+wGcexzuKn8+MQWfQCMGyfj+WSgCkrTl78sZZUg4UdpZdwP7IlArefCy1dgw
 aSO0Zznt8PIQ4rq47F0yXApjsfYSj28=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-aQ3rwKPMNxyIfURpiDsVUg-1; Thu, 19 Mar 2020 02:37:02 -0400
X-MC-Unique: aQ3rwKPMNxyIfURpiDsVUg-1
Received: by mail-pl1-f199.google.com with SMTP id 2so814399plb.20
 for <samba-technical@lists.samba.org>; Wed, 18 Mar 2020 23:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=4EFzqCnsc9uqTv2jzt9y9GHIk6IKOULoygRR+FBjH5E=;
 b=Qq1vS0rOH0PN7S0ey6GQyyUXu43VKq/4+xhN0pY3AvJZ4bN6S7Mu14BLNE+FTUSeX2
 kzzoAHlx99wFAa4FmGNNpm2MWDLx9bacl+YNheOcQUdm7MvxzVs8IzN+1P0FNmKQU48d
 K+0BKkjJz9BMScBO4xNYueAbr07WzixaqGcaaUSNqhfsRpeGyyyW2/i/dn7LDnDyYW9a
 wBr4UWuduTSQSwlGTU5mGjEh9aT0TwJfKWQfU1f/3k9rBG4M3G3hLI34ru5LOfPYLCRk
 evD8Uf88rgps2tgr+fXsVQomqo3zHtuIhq7z2T0Df8VZz6EBPlBZ2n6sO8IJPNJMxNM8
 Ygmg==
X-Gm-Message-State: ANhLgQ3y4UOEktcmDTCYbqFQohKdxCxOGEfsEYOIf9LI5skbZP0nyMP4
 rvq3RGxVa2dXsdNK5E8jYEnileuFrPmGl4GFGei6rRNqaSLkGRiw1N5GgOwDajGsu2QIZVIg6Ck
 Z3L4JBYWUdBG8eglnwtHAtonlHVTr
X-Received: by 2002:a63:564d:: with SMTP id g13mr1716354pgm.157.1584599821448; 
 Wed, 18 Mar 2020 23:37:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vurQ8DH7rBX7lJaiHYQ1NN3hpxbLvzEkdRf+mniYu3AmqnO9yvAoVpCKhSoqn3+RY2V7XA/pA==
X-Received: by 2002:a63:564d:: with SMTP id g13mr1716326pgm.157.1584599820969; 
 Wed, 18 Mar 2020 23:37:00 -0700 (PDT)
Received: from amitkuma.pnq.csb ([103.83.215.40])
 by smtp.gmail.com with ESMTPSA id 8sm1044887pfv.65.2020.03.18.23.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 23:37:00 -0700 (PDT)
Subject: Re: smbclient(samba-4.10.4) cannot log data in log.smbclient while
 samba-3.6.23 can
To: samba-technical@lists.samba.org, samba@lists.samba.org
References: <639e0583-ccbf-9fa3-893f-730283c8abb1@redhat.com>
Message-ID: <f23be61e-1164-43b6-998e-d78e4a8318d2@redhat.com>
Date: Thu, 19 Mar 2020 12:06:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <639e0583-ccbf-9fa3-893f-730283c8abb1@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Any updates ..

On 3/18/20 18:04, Amit Kumar wrote:
>
> Hello,
>
> smbclient cannot create log file when log-basename is specified in=20
> samba-master.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -l|--log-basename=3Dlogdirectory
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Base directo=
ry name for log/debug files. The extension=20
> ".progname" will
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be appended =
(e.g. log.smbclient, log.smbd, etc...). The log=20
> file is
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 never remove=
d by the client.
>
> *On samba-4.10.4*:
> # smbclient -l /var/log/samba //<samba-server-ip>/<share-name>=C2=A0=C2=
=A0 -U=20
> username%password
> smb: \> ls
> =C2=A0 .=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 Wed Mar 18 05:34:29 2020
> =C2=A0 ..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 Mon Mar=C2=A0 2 06:46:14 2020
> =C2=A0 test1.xml =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 A=C2=A0 9727426=C2=A0 Mon Mar=C2=A0 2=20
> 06:50:39 2020
>
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 26699940 blocks of size 1024. 15243=
04 blocks available
> smb: \> q
> # ls -ltr /var/log/samba
> -rw-r--r--. 1 root root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 Mar 18 05:3=
5 log.smbclient=20
> <<<<<<<<<<<See file size=3D0
> #
>
> *samba-3.6.23:
> *# smbclient -l /var/log/samba //<samba-server-ip>/<share-name>=C2=A0=C2=
=A0 -U=20
> username%password
> smb: \> ls
> =C2=A0 .=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 Wed Mar 18 06:41:49 2020
> =C2=A0 ..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DR=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 Wed Mar 18 06:41:45 2020
> =C2=A0 file-1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0 Wed Mar 18 06:41:49 2020
>
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 44732 blocks of size 1048576. 36679=
 blocks available
> smb: \> q
> # ls -ltr /var/log/samba/
> -rw-r--r--. 1 root root=C2=A0=C2=A0=C2=A0 242 Mar 18 08:13 log.smbclient=
=20
> <<<<<<<Creates the file.
>
>
> I tried breaking samba-4.10.4 in setup_logging() using gdb but on=20
> running gdb "Single stepping until exit from function setup_logging,=20
> which has no line number information", maybe its pproblem of gdb ad=20
> gcc version mismatch but i am using both latest version.
> samba-3.23 breaks perfactly into setup_logging().
>
> I think using git bisect between these versions would be tough as,=20
> versions are far apart.
>
> Even there is significant change log handling between two versions. I=20
> tried adding the old code back but still no luck.
>
> samba-4.10.4/lib/util/debug.c
> void setup_logging(const char *prog_name, enum debug_logtype new_logtype)
>
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debug_init();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (state.logtype < new_logtyp=
e) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 state.logtype =3D new_logtype;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prog_name) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 const char *p =3D strrchr(prog_name, '/');
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (p) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog_nam=
e =3D p + 1;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 state.prog_name =3D prog_name;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reopen_logs_internal();
> =C2=A0+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (state.logtype =3D=3D DEBUG_FIL=
E) {
> +#ifdef WITH_SYSLOG
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 //const char *p =3D strrchr_m( prog_name,'/' );
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char=
 *p =3D "/log.smbclient";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (p)
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog_name =3D p +=
 1;
> +#ifdef LOG_DAEMON
> + openlog( prog_name, LOG_PID, SYSLOG_FACILITY );
> +#else
> + /* for old systems that have no facility codes. */
> + openlog( prog_name, LOG_PID );
> +#endif
> +#endif
> + }
>
> }
> --=20
>
> Thank you,
> Amit Kumar
>
> <https://www.redhat.com/en/openshift-4>
>
--=20

Thank you,
Amit Kumar

Red Hat Insights - Predict risk. Get guidance. Improve security.
<https://www.redhat.com/en/technologies/management/insights>Red Hat=20
Enterprise Linux 8. Any Cloud. Any Workload. One OS.
<https://www.redhat.com/en/enterprise-linux-8>Red Hat Openshift 4 is=20
here <https://www.redhat.com/en/openshift-4>
<https://www.redhat.com/en/openshift-4>

