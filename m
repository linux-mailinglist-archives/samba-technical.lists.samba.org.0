Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F6A051CE
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jan 2025 04:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ju19JtvXWMoUigY13sgj2e0U0AxGuzEgIfxtimE+HZk=; b=Z2bAmPTtsGXXTITPxuElRY5HBx
	CnI8gW968fJsFcoGWgtxZwI+fcRnJuCKUDgMwIEKTip0OdWt2ECITtRYa6UWfSZ6/nDxdjsDt3vs3
	XD4SuEll7vcXpyZW7JvI2yOrilMrWibR1EuR3YKUNekOc1IhRasbu587h139iPicupvPAesC/YVas
	ao42RVcgj7ZJPAnC/LWaWa6dMh5GX34QhbZaQ2KZVhUsZ4HyHjDNgGg9t5JSs4SGfhE+1mPfMkUa5
	Vl8vw1Z5DF45cq1PxGvj1b8dQRTis/nt+qhbXCCDqwCI1jl0cH/nBnJu1hVzmf6lG067Lxnn3dIls
	bYsdc56Q==;
Received: from ip6-localhost ([::1]:27930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tVNCV-007a1m-0F; Wed, 08 Jan 2025 03:57:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42285) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tVNCP-007a1f-UD
 for samba-technical@lists.samba.org; Wed, 08 Jan 2025 03:57:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa692211331so88879066b.1
 for <samba-technical@lists.samba.org>; Tue, 07 Jan 2025 19:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736308660; x=1736913460; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=koch/yMa8/5zy83OPMgN0G/sbVZEsA9o3PSBl7y0qRI=;
 b=cqKscYR/u6RTxAFNPvCLKXJObVAQM+xCravtSoYKyAd265u8cQMMslx8a+/m6wdcza
 TQErEqHq6yO6kvC7Gq/7pP17G/vXvMc7yl/G8RXmw7JZ+VPzvQ+FPPcEbeAXvbAJUjiS
 XbcfAMyc6WzWG50ktMRYqhDyEGUES9evoHD5DFeLUI4wgniC3rGPHsJW7je9m0VvATOA
 wfX6Xs2Oqhu8pJJ7oj33Q/3/A/40eID5VdHMczNv+PzKLPXhfUcDB/f4SxbuTj0h/cBY
 YvD7lNfGTXZCBp4u9p0k4JigvyhPnCBx3VTE9SxbyG8MP61MdACBQQZ2/bw5FvI5eVLC
 Acig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736308660; x=1736913460;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=koch/yMa8/5zy83OPMgN0G/sbVZEsA9o3PSBl7y0qRI=;
 b=vis/wYUlvcdxuFuhanxGgAHh9uWMcOR3JACeHDRTvYI3MJH2+huNDKQZz9l8fXVCB6
 NJP70ra4n4Un0YmCgNGHCX9y2OW58J9w+98i2tzjS9a63aAZGt0jBEYZt/o6em7wGBqL
 Mi0jJVYTztP+WQaSinVWJ2QGXizJ0gJSvem2q0gPsWDRDYrNXZyvwVtfXUWKVUni+2j3
 IDkqDaup9xGjOlO8c1NC7oAClgkec14XvR8DFIfvDJste23rn4lMI3trWFAFA1fifSu8
 DJb/mK2dSR1P3aDmtPqtOlyKI+/B2AazxC60XZB/i0dAamcBKbABf5PR9cFGyy6cnjG+
 hX9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwo0QBgyG1jVETGYjQGAOXeg3f8HL9b3SlkTB0ZNTKVEfItls8KP6Le70BtmzBFTM9WVd/9l88gs6BRq18KwY=@lists.samba.org
X-Gm-Message-State: AOJu0Yz4A2HjEGTI6YLC81vXtWN9YAB8IbRXkC4B7ubx8a4DHt+WyVM6
 iLj3JkwMFuhYg5GB6OQ1xoGHcnTXyrjMQ+fuUKjMNiJJfRZM/o7w6DorWe/YIO6hg0bW9Z6Xvwl
 mb2Ki+cS8p4qwYmGhAsvG+8ExjHY=
X-Gm-Gg: ASbGnculJgkfr3VNkQj5UhakMpbKbt1n0xv8qVzHv4/8bHpbUVwoF4sXTHPhfJqm9od
 udybBuTEFASWRlwjOECESNRlDzkEZJseVP8B67w==
X-Google-Smtp-Source: AGHT+IHjxeFi7kjk/VxLdBErKxA8EPMG+fIN6+yGRLtUGnrdjSSMc9U1fTmicX+w/WS3quA/lYEwn7e3jAa8Z548+Kk=
X-Received: by 2002:a17:907:9802:b0:aae:f029:c2ec with SMTP id
 a640c23a62f3a-ab2a79f3143mr117288766b.12.1736308659892; Tue, 07 Jan 2025
 19:57:39 -0800 (PST)
MIME-Version: 1.0
References: <tc6xfz3it47oxa224ert4fs2u36h3qefm2elc64kugofrujk4t@vh2wevz6y6qc>
 <ZseZLpuINSxGdIJZ@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZseZLpuINSxGdIJZ@jeremy-HP-Z840-Workstation>
Date: Wed, 8 Jan 2025 09:27:28 +0530
X-Gm-Features: AbW1kvYrql6-WBB_ePX6q1BTr94XD1azvuXJKxow9DACk4hZLer6RxOlJrMr6K8
Message-ID: <CAP4uAdrsMCM5veupRcNgUXSt+LG0TwawqP6xYA2ws2jNkkpZbg@mail.gmail.com>
Subject: Re: Helping to improve FreeBSD support
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: sandeep nag via samba-technical <samba-technical@lists.samba.org>
Reply-To: sandeep nag <sandeepnagamalli@gmail.com>
Cc: John Hixson <jhixson@freebsd.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

@John Hixson <jhixson@freebsd.org>
Me too looking for Samba 4.21 to be build on FreeBSD 13.*
Let me know, samba side of the things to be done for this and I can work on
them.

Thanks,
Sandeep


On Fri, Aug 23, 2024 at 1:33=E2=80=AFAM Jeremy Allison via samba-technical =
<
samba-technical@lists.samba.org> wrote:

> On Wed, Jul 17, 2024 at 08:54:20PM -0700, John Hixson via samba-technical
> wrote:
> >Howdy!
> >
> >Would Samba be interested in better FreeBSD support? I am reaching out
> >on behalf of the FreeBSD Foundation. We would like to help improve
> >support in whatever way we can. What needs to happen?
> >
> >For starters, I would like to help get as many of our port patches
> >upstreamed as possible. I would also be interested in helping out in
> >areas that are specific to FreeBSD. It would also be nice to have some
> >CI setup.
> >
> >Interested? Where to go from here?
>
> Very interested. Please send the port patches upstream !
>
>
