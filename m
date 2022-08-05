Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915658AB77
	for <lists+samba-technical@lfdr.de>; Fri,  5 Aug 2022 15:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vW1JKGFDfhmz5KnUFman4iPHuJyO+Dj3pQjPBm604cs=; b=Fidu49y8StlOeGjb6wkXAKYC7x
	OshznS9XLfiFXWkYjbRNE1jZHWJ4bxO1QaTisXjMgt4iQfQPkT6pZ3tj1RYJnrpjrQJ0GrXzw4zZj
	ojbGKO0Ev/3HU1CNoWmV4h+puRST3rkFWLB5qrJfhk72X9q5vP9JBQwzptguIVTOfQEUdvSAXo90D
	7DBX9wX8bOj9XDYCkgNPRZ88nZA5A1k+mn4Yg1/WshUj5UgP+gh/eQgdedXoYz+8Cb0ZgCnG1gwjC
	1tICyHk34P5rgAUc+c5omDcEOpVM0swdfnYqA9Po4z9qYEWSMBGdhCezNttGTaKqwUYBSLZ6lbaxJ
	oHtB5U7w==;
Received: from ip6-localhost ([::1]:63284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oJxDG-005esA-6p; Fri, 05 Aug 2022 13:18:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21610) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oJxDA-005es1-WB
 for samba-technical@lists.samba.org; Fri, 05 Aug 2022 13:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=vW1JKGFDfhmz5KnUFman4iPHuJyO+Dj3pQjPBm604cs=; b=mRPfN14PaJbyeZrj2TG2GpEkrL
 9nfELIijObPtJgA4qPNhKSY4u+Ap0VQo19CRjI7jvPoxFDg8sRAw/DrcHBxlHSJ/qPw1MGKjIEWX/
 kwmByzBvFeDxG9RqFuWAMHyFpYJtNuk6wsweZwIpwnK9COhb7P2ufZ9w0TGFIl0V1yLr7Yz4Jyuru
 OfPwQ5usKuwCFjOhYIUuRwclA+W+5BVIidX84rYHG8oRKavfhZnlACEvi7TsrATJjSclbWf7Hoejz
 3giQhYynlTWE/akKOORJ9PbQypotPDz/Yiuxfml0t/bxkHFTL53JEgCfpjwZcHHpm+fjTv5NJ0f5+
 rr/T4zniZPI9+7Ctjq1SSwZzblEd+yL6a9y1XfU9LCOLQJRV+wjXyQC+QtbLEEy7m09LM7scQV4s2
 z1yy5cQy35OLJ2Twqo4xmgvh06nxc2sGPoBBCRHT6Azv2KpblD9LH9jZ2NZs5WCbX4+6K87vDtU67
 X7ZgS/Hd+PduqHXeKgQ7kznx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oJxD8-008EOl-2C; Fri, 05 Aug 2022 13:17:54 +0000
To: samba-technical <samba-technical@lists.samba.org>,
 Joseph Sutton <josephsutton@catalyst.net.nz>,
 Matt Grant <matt@mattgrant.net.nz>
Subject: Re: Hung up on writing Unit tests for dynamic DNS update from
 different source addresses
Date: Fri, 05 Aug 2022 15:17:53 +0200
Message-ID: <2258887.ElGaqSPkdT@magrathea>
In-Reply-To: <CAHA-KoME1TZeUmnRks5mQg6nVG3+eUvaJJ5SnE=YUA16YHvVsw@mail.gmail.com>
References: <CAHA-KoMtF8x6mRHoyXuv4oeXo+1KKbVx=AVwgPO6YHsYvpW-EQ@mail.gmail.com>
 <CAHA-KoME1TZeUmnRks5mQg6nVG3+eUvaJJ5SnE=YUA16YHvVsw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 2 August 2022 23:15:15 CEST Matt Grant wrote:
> Hi!
> 
> Figured it out, after a bit of digging.
> 
> Can't use the test process itself as need to
> set SOCKET_WRAPPER_DEFAULT_IFACE to say 251 which sets the source IP
> numbers to 10.53.57.251 and fd00::5357:5fxx.  Or maybe I could try the
> loopback source address of ::1 for example?
> 
> Will call nsupdate (needed for testing samba_dnsupdate) via Python
> subprocess module to do the work.  Bit messy, but there is NO way to add
> extra IP numbers to the current socket_wrapper interface context that I can
> see from its man page.
> 
> Thanks guys!  Will get this done.

The number of addresses is limited as we need to walk a directory to find an 
IP address.

from 'man socket_wrapper'


SOCKET_WRAPPER_DEFAULT_IFACE                                                                                                                                                 
           Additionally, the default interface to be used by an application is
           defined with "SOCKET_WRAPPER_DEFAULT_IFACE=<ID>" where the valid
           range for <ID> starts with 1 (the default) and ends with 64. This
           is analogous to use the IPv4 addresses 
           "127.0.0.<ID>"/"10.53.57.<ID>" or IPv6 addresses
           "fd00::5357:5f<IDx>" (where <IDx> is a hexadecimal presentation of
           <ID>). You should always set the default interface. If you listen
           on INADDR_ANY then it will use the default interface to listen on.

> Best Regards,
> 
> Matt Grant
> 
> On Tue, 2 Aug 2022 at 21:12, Matt Grant <matt@mattgrant.net.nz> wrote:
> > Hi!
> > 
> > Code as it is up in merge request:
> > https://gitlab.com/samba-team/samba/-/merge_requests/2271
> > 
> > It's come a long way.  Been cleaned up a lot, and just completing the test
> > suite.  Need to test
> > denying DNS update by IP source address, and updates authed by IP source
> > address.
> > 
> > Have managed to update dns_base.py to optionally bind to a source IP
> > address for a query, but can't figure how to
> > set SOCKET_WRAPPER_DEFAULT_IFACE for the test/special test suite process
> > socket wrapper stuff.  Tis getting quite seeing double inside
> > selftest/target/Samba4.pm and source4/selftest/tests.py....
> > 
> > Could some one please lay out a map for me how to proceed with this, or
> > just help me to give it this extra push with this to get this over the
> > hump
> > and accepted for merging?
> > 
> > Thank you!
> > 
> > Matt Grant


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



