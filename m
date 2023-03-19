Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 379D26BFFDD
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 08:50:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DfCXs3jd/fVqkTus8Pi6Nu+pm+O0Dmzny6mAmb0ShWA=; b=dHwKb3fKsXF9ITH4b0ij79LguG
	DH00ltqHWbSJ0402JxCtRMIbWs5OCt1Rjw4ffTN50hpbKa/cljcL2x0RDPU1LB4w6VowtCAAO+dDv
	NNfXxPqXj2ZWvuGO2VhdF/n+i7zgR3WxjhQE9xVIvihIWTxkQC7foX/cQvvnf8h5uEVQaUcr192SY
	4F1cyyOAA+JHyFqEJPZZ1lypWQRyFMDiN80KTs4dVuWpgGs0ms9ElgtJMLNBBY98f66UEKDBE2LWe
	9SnS60+O3XQ86jkYuBUw3iduVt5pRZ0jsOFo1BPOv+2a71Li5OQymxsRM8gX3Ey3hHrJOmS8I1Q0x
	dkQv+4aQ==;
Received: from ip6-localhost ([::1]:26438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdnnQ-003M1n-9q; Sun, 19 Mar 2023 07:49:40 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46860) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdnnI-003M1b-Pu; Sun, 19 Mar 2023 07:49:35 +0000
Received: by mail-ed1-x531.google.com with SMTP id eg48so35471618edb.13;
 Sun, 19 Mar 2023 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679212168;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DfCXs3jd/fVqkTus8Pi6Nu+pm+O0Dmzny6mAmb0ShWA=;
 b=muoSJYyfV5GAamJzIp0fdFZZ4OFafgNsM0pobqGWpzJ1aIOeN12r62toRhgEK50nQc
 D7ePG3i36ZgR/UsD+5PIVnsgvDhV/W0kU/K5V+pY1ZuXrdjP0zu7VQ4WOH0iTEKPXrVV
 KRnelOyKqxFhpD0EtaD92mh2TGOe/FYSsvdxfiJJ7mw4ZPX3PwAz+uWigj1uwhHbjTto
 r0I8HUQ83IggpdrOO9v+2+r4X/wvpaYbAuncgJ2DxEjXKnsTyrN6saBmR2MffAGgIgEG
 rP+6orssMCtzlplxvCeFf7vfTnAnYQYjmbkEQLYvc8a3K9ymWPTZKax5ivMJ3oynjClH
 msNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679212168;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DfCXs3jd/fVqkTus8Pi6Nu+pm+O0Dmzny6mAmb0ShWA=;
 b=1EVBmx3H+pwLtadmsoH1WFhCpEuWA1csLTzgDYmGD2PLr4ycrhlaqKBDyScAP7LUVK
 Rx8QE9fuqGOTVzBz8AC5qbDbMKoKKs/k/LOKdjc82JVzotXLRWzunLBWPj/uqbya0/rc
 6ziRvGjzMqIflxNFfvlqo1eu0U+fxgxY5aTznzOtffCycBxmIo6Bj5MEFyEJ/8PVJeeD
 SXTs/LhRZsOh/HOetHog6aOKVPFn184EQp6NPGrJQdIyzC4gPTebTI6IXIuRDtvjWuc/
 AAIuY/DGekgV3uZVWD4K2cJIB5WjLzumChCC6lvRnSzuGS1rUf4wklYgJBlpJOoPlHzx
 El1w==
X-Gm-Message-State: AO0yUKVOnAprRmkMO7gAzsABsOMN3IlpSZz6fDu6l6uT+DgvDsPQmc4o
 gz/nTsucNXaa0TxXNDwk2V56MA0YGddGrKfgeud3gT+C
X-Google-Smtp-Source: AK7set8RiAnRLC/2XgT8lapT63WOCClL3b1uNNT1CXSyO34GbIs8+Q2CDIej4ChKTzA8wSJEl1dc/2GKuoyMKdeZovQ=
X-Received: by 2002:a17:906:228b:b0:931:6921:bdbb with SMTP id
 p11-20020a170906228b00b009316921bdbbmr1962295eja.2.1679212168080; Sun, 19 Mar
 2023 00:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
In-Reply-To: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
Date: Sun, 19 Mar 2023 17:49:16 +1000
Message-ID: <CAN05THQ7YotxdgZqAtPkCbERTy_dg0qrnAL9Lqi5W7qoPX2r3Q@mail.gmail.com>
Subject: Re: mit-krb5 and heimdal binaries
To: Michael Tokarev <mjt@tls.msk.ru>
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
Cc: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Kerberos is important.

I think the question is which kerberos implementation has best
support, has best tooling, has best and prompt responses to CVEs or
bugs
and which one is going to be the most common uses by the target audience/users.
I.e. which one is most mature and will cause the least maintenance
overhead to the samba devs?

On Sun, 19 Mar 2023 at 16:13, Michael Tokarev via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi!
>
> I already asked a similar question before, but it keeps popping up in different
> contexts and forms, and the more I use samba myself, the more often it comes to
> me too, especially in context of using various security tokens for auth.  And the
> more I think about all this, the more sane it looks to me.
>
> The thing is: mit-krb5 has much better user-level support than heimdal. But samba
> does not fully support mit-krb5 as an active directory domain controller.  The
> AD-DC thing is server-side.
>
> I can think of providing two builds of samba for a distribution (eg debian/ubuntu), -
> one implementing whole ad-dc, as a complete thing, using their own set of libs,
> linked with heimdal. And a usual set of more client-side packages, with their own
> libraries, built against mit-krb5.  Or maybe some other combination also has its
> right to be, - for example, smbclient built with mit-krb5, the rest is heimdal.
>
> An essential part of this is that the two sets (built against mit-krb5 and heimdal)
> do not share any internal libraries, each has its own libraries. This way, there's
> no "mix" of differently built samba, each build uses only its own libs, so there's
> no clash here.  They share the same smb.conf though.
>
> So far, I've seen requests to build two versions of the server (again, with mit-krb5
> and with heimdal), - and I faced the same issues too.  This is because a regular AD
> member server is also good to have mit-krb5 support to integrate nicely into the auth
> infrastructure. While for ad-dc, it is less often used as "end-user" server.
>
> So I can think of a separate samba-ad-dc binary package providing whole samba suite
> built against heimdal (maybe without smbclient and some other minor things), and
> samba "file server" binary package providing regular server not suitable to use as
> an ad-dc, but conflicting with samba-ad-dc, so it is not possible to install one
> together with another.
>
> This approach also has another good side effect, to discourage usage of samba-ad-dc
> as a regular file server.
>
> Or maybe the whole thing is moot now, and we just can provide regular samba built
> against mit-krb5 to work as a good AD-DC?  That would be the best solution IMHO.
>
> Thanks,
>
> /mjt
>

