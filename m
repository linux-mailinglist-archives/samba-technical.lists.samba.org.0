Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9DB7821C2
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 05:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8yXzWR38ueXmt6l/8e8GBL7YvlKA9C0JhrsEQeEyQVQ=; b=cWsqbddtZSYq759UcyEgHcYrWh
	1CRC1ohHNk2jv7QeQZ2dy8hHK7h+HRHCet8GhKiQeGYmV2DNNCivZIXjXHl22QonHIBO8DumjZLId
	gamDCzbLME3cmWOC8Q0vT6qEWN7WPCXTIh5I7gB344ilDpuZalYJA9gYeu9K1B/D2seInIIFntvdV
	RjCI2GyIhE15ZeWG8tviOwpjI5rxsExeDBy9MocXrPrPDL3cCet6iBGVO4TH8NR6O57FL6bL1ehEZ
	5OetEjt+3HS2hYDpAcG2y17VuYo7O6ZtCf9jj2qn7qAuHeRJSx02md5swVxWiOtxk6IcQXPJ+8qTD
	QygTi7FA==;
Received: from ip6-localhost ([::1]:57040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXvKI-00DXnB-5I; Mon, 21 Aug 2023 03:11:34 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:60456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qXvKA-00DXn1-3t
 for samba-technical@lists.samba.org; Mon, 21 Aug 2023 03:11:29 +0000
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7a006828e99so796895241.0
 for <samba-technical@lists.samba.org>; Sun, 20 Aug 2023 20:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692587482; x=1693192282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8yXzWR38ueXmt6l/8e8GBL7YvlKA9C0JhrsEQeEyQVQ=;
 b=RqTHZKnQtIYy2YtFPKJlPsMoBBP9sOdTY23EXpx8d8gncexbUhMzqQWZ0oAtPIPrXA
 2NYnGRQjBHzsEyLicMN+iiXfZ28Uc5ATINAVk6RtY832xfEJCE9t8S8qxi7EPVXpk/05
 5vRqp6iPB7EcmZ8aLYJLgTuWDE6hWCGLVfeGeAthdBY66Zz+PhIeo/gEx7Fnc9GSX9fV
 IRE/T1W21/2gAA7S24/DAXde1ogJ2giI6Wz8uA3ZN4+BN54ocv+GqowXKfwXfV7obDwb
 /pDJ/5ZfDuMg0vpyWRLZkYIAO2IfM1x8qxelHkSsehdhqMv1rg/erUjK0jkVaEV7KwmN
 rOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692587482; x=1693192282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8yXzWR38ueXmt6l/8e8GBL7YvlKA9C0JhrsEQeEyQVQ=;
 b=Tsp+9d42fnrdaNGci7RH14w9rd/4NxGTAwClz4OhS6hD9xybZwjlyy6lFgs92OOADE
 KJqA3VGbqun3Z8dgZCzU3buUpi+osQC0am9VwEhe/x9VsUz9IIu54d8Z7gmE5cH4Bj+P
 zH+WQWuerwrLVlDWHXh7DMhLSuRVdgz16qag+gN2o5BZRZuIpn3ej9QjDw2idg0775L/
 pRJFPbpyzUp10FOQiTyArAA4YhRVOqRrzUlmhp6q3Mnw3YlrvdQlQ2RdZpBz781c7VZJ
 PwpO1NpmHvKxJ0PJkmLWz+GUlx50ytDhmvCz2Y1WJf9D0viUIzyHvuDoMmQFfU1P83Ra
 zHQg==
X-Gm-Message-State: AOJu0YwKxV/4cDBinOjbt42/ZVcIVzCbH1pHUlnmyyt186tTbIJAiAJ4
 WxyFhXs6FBmCnUSHD6AY3dvl3Rvl9p0AI3FVM2g=
X-Google-Smtp-Source: AGHT+IGQZv4HASvU6i5fhJ1zceqUcsqZ4lpCIlErXyeeCzk+Mz22gL9muxK4iPkuhRcS4Xoq91l3/DEnIeM5eqGzjM8=
X-Received: by 2002:a67:db0b:0:b0:44d:5298:5bfa with SMTP id
 z11-20020a67db0b000000b0044d52985bfamr201262vsj.2.1692587481727; Sun, 20 Aug
 2023 20:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPzjJTfpx7ad2BQS0CiN0SRazz_7tdSwDnX7+qZR9VFfYg@mail.gmail.com>
 <dd2f4ba33c19cae2271c23c9bfb5e90d5d3172c1.camel@samba.org>
In-Reply-To: <dd2f4ba33c19cae2271c23c9bfb5e90d5d3172c1.camel@samba.org>
Date: Sun, 20 Aug 2023 20:08:08 -0700
Message-ID: <CACyXjPw2uB5cCERsytg8SDK+3f-69QeZgD81SP22O=1D+byJUA@mail.gmail.com>
Subject: Re: Building Samba master from a few days ago on CentOS 8.5 runs into
 a weird Python problem
To: Andrew Bartlett <abartlet@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Aug 20, 2023 at 7:44=E2=80=AFPM Andrew Bartlett <abartlet@samba.org=
> wrote:
>
> On Wed, 2023-08-16 at 18:50 -0700, Richard Sharpe via samba-technical wro=
te:
>
> Hi folks,
>
>
> I am trying to configure Samba master from a few days ago on a CentOS
>
> 8.5 system.
>
>
> I ran the bootstrap script and it only complained about lmdb-devel ...
>
>
> Then when I ran configure --enable-debug, I got this error:
>
>
> --------------------------------------
>
> # ./configure --enable-debug
>
> Setting top to                           : /root/src/samba-ad-error-injec=
tion
>
> Setting out to                           :
>
> /root/src/samba-ad-error-injection/bin
>
> Checking for 'gcc' (C compiler)          : Traceback (most recent call la=
st):
>
>   File "/root/src/samba-ad-error-injection/third_party/waf/waflib/Utils.p=
y",
>
> line 833, in wrap
>
>     return cache[k]
>
> KeyError: (<samba_waf18.ConfigurationContext object at 0x7fb83837d8e0>,)
>
>
> During handling of the above exception, another exception occurred:
>
>
> Traceback (most recent call last):
>
>   File "/root/src/samba-ad-error-injection/third_party/waf/waflib/Utils.p=
y",
>
> line 833, in wrap
>
>     return cache[k]
>
> KeyError: (<samba_waf18.ConfigurationContext object at 0x7fb83837d8e0>,)
>
> ---------------------------------------
>
>
> In looking at the Python code it seems like there is an issue with the
>
> except KeyError clause in the code.
>
>
> Has anyone seen this issue before?
>
>
> Richard,
>
>
> Just checking if you managed to work it out?

Yes, I did thank you. The bootstrap script had not actually run and
all I had to do from memory was to remove lmdb-devel from the list of
RPMs installed.

It was confusing at first because I first built it on one of our
standard build VMs and did not have to run the bootstrap script.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

