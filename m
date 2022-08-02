Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5A588355
	for <lists+samba-technical@lfdr.de>; Tue,  2 Aug 2022 23:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4xaiOwOgJrHiZuJtU+1q9cwLcyPfoad6YXuqRYPmA6g=; b=GSSUwEq3sqIfcmVoJF2s2fpeKP
	6+S+YML7O7RMQ0TRYG3cBFdy0PgViThwbbNs8puSmtqqr8r56c8pUw0wbk9sKfXT3DbxmW3utyH2A
	87OjFt0v9+CqYp++wpP3zXJ5iCU46LicSZRko3hNnFnEHXbxXRFRWlLni+BE3ChMXh012badexwkW
	rNdIxm++xD/rPQIsWEDfDimFk7GXHrWyHIwloF3sUQNoCbaHNwlDHuwGm/RPxRX3unDgEiSPjnWhO
	qX8wE1+GfSK8O58l70Vby0E+3Bjj1uNwWEELTL3ZVQU+a21xr4aavg22SpyeYwawLTtTnoQ7xAGXL
	MimmWpUw==;
Received: from ip6-localhost ([::1]:51042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIzEq-0053V5-V0; Tue, 02 Aug 2022 21:15:41 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:43792) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIzEj-0053Uv-SM
 for samba-technical@lists.samba.org; Tue, 02 Aug 2022 21:15:37 +0000
Received: by mail-qt1-x831.google.com with SMTP id a15so1529681qto.10
 for <samba-technical@lists.samba.org>; Tue, 02 Aug 2022 14:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=QuTfyJTyyo7X/tFJZb7+/bdbzCr31LihNeLDoI+fSiE=;
 b=LCnavnbJtCJAd7LEb1+BkHpZdSzbKQloyc2QMso2FMUB9e/Ebi6zRMPK94e/CNVhl8
 mwhy3oe2zKymG8/rzG03dB3QuTaAh+j/0m4VAuBLfKaa9fAoJY6XCQ9I9j1/7ChsHAPe
 LrFnOV9IlbmVda1uWZsXpGsfxkEeWf0ZGxBYV3LyFdm2Nzr4riT8klHrpJStBjYBOJ/I
 kaB9skJIB0MdGaHvrNR1GuQLjyMnHN/4PKyFSm++a9T4RFt9f8UFDbCTgS3DCxI2MLAN
 7k24bbegnoxXvMXznfXL5RKH1qcmKiSsrMQCMxrUvXb1hmpBucaYWUd+bRL7TBXJl4XI
 ZnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=QuTfyJTyyo7X/tFJZb7+/bdbzCr31LihNeLDoI+fSiE=;
 b=nJdAj8I/108MYxWBbcZpv1R8tZF/O9eE/k4rzeLv0U1bafVJKDHrDCF6MsiPML9RZl
 wreIsnn0c1+uvp1u9ApL+uz+uUZxvrskQf7S5fRTen/gLGMBgUM6UzbgfDEnXc9lMvlL
 lTbKHldUdm7G2aZ4LEE+tNDzOySYCmSRpapLtot9vNg5Rrz37m5q0CE5OvTN4GzVxETS
 UD69AbW5h6wKGb0HIb5b3dHwIjHwGo5/JVDKLMcR3iTjVnPvMLhC7QkAERgQOaeYkPCq
 mN+ufu3sJv8QYtjAXXay8ALv5Spz85zkqYBOpg0tVUeOOQRDFD8EcGkZZvtifbw5x07M
 zpKw==
X-Gm-Message-State: AJIora+5nLTqO6L//FlkVQDM02sj3wdQTvS7p8gWiG6qUqA8CxwkkcXK
 hh1E4y6DED0znOfRa0Pa9Xa37qoFYg6abNVbateN/A==
X-Google-Smtp-Source: AGRyM1sdb10TsFsgOokcTovbdynhr6xW5flx8GN2jIAOmDzQof8GL5Veheo84eB60EF2c3hIKAiXpvH05mKgeT/PgYU=
X-Received: by 2002:ac8:58c2:0:b0:31f:8a2:1bb2 with SMTP id
 u2-20020ac858c2000000b0031f08a21bb2mr19388821qta.121.1659474926101; Tue, 02
 Aug 2022 14:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHA-KoMtF8x6mRHoyXuv4oeXo+1KKbVx=AVwgPO6YHsYvpW-EQ@mail.gmail.com>
In-Reply-To: <CAHA-KoMtF8x6mRHoyXuv4oeXo+1KKbVx=AVwgPO6YHsYvpW-EQ@mail.gmail.com>
Date: Wed, 3 Aug 2022 09:15:15 +1200
Message-ID: <CAHA-KoME1TZeUmnRks5mQg6nVG3+eUvaJJ5SnE=YUA16YHvVsw@mail.gmail.com>
Subject: Re: Hung up on writing Unit tests for dynamic DNS update from
 different source addresses
To: "asn@samba.org" <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>, 
 Joseph Sutton <josephsutton@catalyst.net.nz>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Figured it out, after a bit of digging.

Can't use the test process itself as need to
set SOCKET_WRAPPER_DEFAULT_IFACE to say 251 which sets the source IP
numbers to 10.53.57.251 and fd00::5357:5fxx.  Or maybe I could try the
loopback source address of ::1 for example?

Will call nsupdate (needed for testing samba_dnsupdate) via Python
subprocess module to do the work.  Bit messy, but there is NO way to add
extra IP numbers to the current socket_wrapper interface context that I can
see from its man page.

Thanks guys!  Will get this done.

Best Regards,

Matt Grant

On Tue, 2 Aug 2022 at 21:12, Matt Grant <matt@mattgrant.net.nz> wrote:

> Hi!
>
> Code as it is up in merge request:
> https://gitlab.com/samba-team/samba/-/merge_requests/2271
>
> It's come a long way.  Been cleaned up a lot, and just completing the test
> suite.  Need to test
> denying DNS update by IP source address, and updates authed by IP source
> address.
>
> Have managed to update dns_base.py to optionally bind to a source IP
> address for a query, but can't figure how to
> set SOCKET_WRAPPER_DEFAULT_IFACE for the test/special test suite process
> socket wrapper stuff.  Tis getting quite seeing double inside
> selftest/target/Samba4.pm and source4/selftest/tests.py....
>
> Could some one please lay out a map for me how to proceed with this, or
> just help me to give it this extra push with this to get this over the hump
> and accepted for merging?
>
> Thank you!
>
> Matt Grant
>
