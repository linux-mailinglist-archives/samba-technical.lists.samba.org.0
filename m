Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9682CDFC0
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 12:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pgu2s+5SjIORnDV1GstZZ02u9fqAnYOFKYZPpcWdefA=; b=CxALihMxvq2LrNnw0F8JefWFd0
	qbytSvRs29fXhY9PpFZ+POtlT+9qcY0Ix98bxA6EZq3WTL10CBzwhLccxialViCDf/CzdxsJv3AID
	XURzPOKSHOLvh5UvQupjWNjsD564nLPg7+6a6PEGdiJim5yces17R11Y/nYhBBpoj98XYmzOUrjuh
	bMF1IC5HEEOtFaZm4JJE8CdBsHYhfA3S7FWgSpbsEBRAWERlHhG655VLn8b1JvpbsUNiCM7uKDzIB
	i+lZ7EQv9fmW2ajXRP9SVJRFJzOsSzOeKTqkx9RPottOekvYtbdsTDpZcq2u6tdOhiCqI5BTAn2NO
	moyhhBDQ==;
Received: from localhost ([::1]:46254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHQhH-001o2d-Sj; Mon, 07 Oct 2019 10:56:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18930) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHQh6-001o2W-KC
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 10:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=pgu2s+5SjIORnDV1GstZZ02u9fqAnYOFKYZPpcWdefA=; b=vyY9Vki8j8bj2K7ikI4FJ+xLyM
 sVyNjSQhbIY0vIJNCYDUsi6x6AKd0OVdP22M7kJG95uK/XvfWCmEaLETqoI/SuKZ9P8zxTa4pw3Je
 35VfUJyqVTuuRPK7mukx0nEwp4z7bzpzk7pWR2MVDf6MAZDioo665iAGI+DVL7nf4w04=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHQh6-0004Hn-3N; Mon, 07 Oct 2019 10:56:48 +0000
To: samba-technical@lists.samba.org, Denis Cardon <dcardon@tranquil.it>
Subject: Re: samba 4.11 rpmbuild on CentOS7
Date: Mon, 07 Oct 2019 12:56:45 +0200
Message-ID: <5800371.XWyRSs5115@magrathea>
In-Reply-To: <0091979d-7696-5502-d34d-acd2725bfd36@tranquil.it>
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
 <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
 <0091979d-7696-5502-d34d-acd2725bfd36@tranquil.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 7 October 2019 11:32:15 CEST Denis Cardon via samba-technical=20
wrote:
> It is built against Heimdal kerberos. The samba.spec is taken from
> Fedora (thanks G=FCnter and Andreas for doing all the hard work!) and
> modified to switch from MIT to Heimdal. Actually the hard part for
> building 4.11 on CentOS7 is the requirement gnutls>=3D3.4.7.

Hi Denis!


Samba 3.4.7 is only required for MIT Kerberos. If you build with Heimdal=20
GnuTLS >=3D 3.2 is just fine. Just change the required version in the spec =
file.


With Samba 4.12, GnuTLS >=3D 3.4.7 will be required!

https://blog.cryptomilk.org/2019/10/02/samba-and-gnutls/


Best regards,


	Andreas

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



