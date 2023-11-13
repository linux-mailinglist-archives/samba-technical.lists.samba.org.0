Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A80137E9D10
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 14:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=vF05QaEOHcPakGPyitJCkj+gbDkU87JCmc6d/h+OtWA=; b=mgljJuVocBQrZ/nkLONKNdfNiY
	busxwYeZWH7TaKWhUXtDEYLqrqU+/ixnZHV/jG+3BNCH/S9h7gKw9KPq12bRxnDyAj5HrA0yvfOhD
	vJFv9zTRoqc24NtMIos29ZT0AoNhRy3Ud4WJHRVDMyaQm7Dj1Ko4TNNpnHWGrKSyJKSROaxDvvrnx
	AMm/QNsx9NccQGv0jSdVIP5j3a2MD3HvCMcyJDfix+RUr/XWFiZPW+HKYlcOHcal7bNDvINDd9L19
	hUsMFiRgwRpl6wm82vyajz6RQ6ZWJEe5ZzHtiishY/8GYE4WKTKWci+rOC9QGpUnzKndERz4oO5UT
	8LZYWq6A==;
Received: from ip6-localhost ([::1]:40080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2Wvi-007vsU-Er; Mon, 13 Nov 2023 13:24:42 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:57855) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2Wvd-007vsL-TT
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 13:24:40 +0000
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-da7ea62e76cso4774795276.3
 for <samba-technical@lists.samba.org>; Mon, 13 Nov 2023 05:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699881875; x=1700486675; darn=lists.samba.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hyiCV8mtqBBXFot+GWSWQ7kRDxX0C1Ru5+ywJU8twYQ=;
 b=jhQDzyjyZvwZx8sdEhM4uVgnt43xNKyY7d98quv6+Cj1QXO/u1uVbc0hPEAF8WL6kf
 J2cMxqBkqfdjhU3LodYiCJDQa++fBr7ZWozKx8wGSNGWDCLB75N1nC/8wXmy0BrkRLQw
 rMmTZhcDKnvdDQ2p9fUDvt+m3ybTcqHsou2amx90MZVBqvBTo/bsfGtkp2lCJGvdrZQd
 E89bMuWs4ACpijVAh/J2tFb9cwoidlK6dSZ698WYex3o8P3oZTnVtYWo7NeQ4QV6Dkr6
 SzBSyHWkMrK8fq0KPJnlUus5jEK2zgtihrjAhCWatwW+JpSEP7kSKGigU9BL+WHOUTOa
 9hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699881875; x=1700486675;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hyiCV8mtqBBXFot+GWSWQ7kRDxX0C1Ru5+ywJU8twYQ=;
 b=ZSif6HqTHzlcLcgocZjNxG7pf6GmQ/+VUtEifD3Or0yEe6PJCYYmVWGQ5kYbzSThKd
 FMO4a9Jp4irmNBubchnTe8LomV0G6zBWf/PsRha0txAP2gviJvuMnjoBoU0ojX8sNJv2
 tcNolkEoTLGbX5LtfL0JU0kIek5yGKy/JS8tomjsad8IE5DVpmbRn4mOiCmFQmWkUp+a
 jiP5dCbRNfIXhAnmUvTjfFgr/Y7+3B4BEyMgj/4qsCZfDhLdi+Tet3TJOrYrnHA7JqJi
 lvsmGP+qouISCz32EftqKPc0Y6+nGavaFM5l6h/XyhJV/G4hVAQf1WYvbT+VlDRsFt57
 bY4w==
X-Gm-Message-State: AOJu0YzFoGjvkTU1GUX3kkGHgvvf1b2cRhAVERuN+gKblTbNADfDUer1
 J1EBvZ+jnGrbQI304l94TTU/nXTyk893apsLwUpH+WBtwiY=
X-Google-Smtp-Source: AGHT+IEC2rPJr379+Ar8xJ2Lg4U42i3zAJ5VloagFhAb4aYJ385y37nMN+zsMtxja+B5P3n0EfYSCfaaYVbVktgAkmY=
X-Received: by 2002:a25:37c8:0:b0:da0:c64f:ea10 with SMTP id
 e191-20020a2537c8000000b00da0c64fea10mr5657252yba.43.1699881875361; Mon, 13
 Nov 2023 05:24:35 -0800 (PST)
MIME-Version: 1.0
References: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
 <20231113125324.0cf1b58b@devstation.samdom.example.com>
 <CAOGObpi01iUPmGdB-KhjqNo8t0zgVWK8XJzjw8ATBYD0uWj8xQ@mail.gmail.com>
 <CAOGObpg3sK8soryGdY+BC=TG8=gctm-7gkR0LYxubkFMbGXXkg@mail.gmail.com>
 <20231113131844.1e590785@devstation.samdom.example.com>
In-Reply-To: <20231113131844.1e590785@devstation.samdom.example.com>
Date: Mon, 13 Nov 2023 14:24:24 +0100
Message-ID: <CAOGObpi518QAHT61=NRBfNuyfCKT8+TV7Rf+Y0EX2YzCp5eqzA@mail.gmail.com>
Subject: Re: Audit log dsdb_group_json_audit with with "userSid": "S-1-5-18"
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
Reply-To: Cristian Galvani <galvani.cristian@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

wbinfo -s S-1-5-18
produces as expected:
NT Authority\SYSTEM 5

what I can't understand is the origin of these activities that don't really
exist ;(



Il giorno lun 13 nov 2023 alle ore 14:19 Rowland Penny via samba-technical <
samba-technical@lists.samba.org> ha scritto:

> On Mon, 13 Nov 2023 14:04:51 +0100
> Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
> wrote:
>
> > Right,
> > is mapped to  'NT Authority\SYSTEM'
> > Samba version 4.16.11 on all DCs
> >
>
> Strange, there was a problem where 'S-1-5-18' didn't get mapped, but I
> thought it had been fixed.
>
> If you run 'wbinfo -s S-1-5-18', does it produce this output:
>
> NT Authority\SYSTEM 5
>
> Rowland
>
>
>
>
