Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB9E6CC2
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2019 08:13:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=z2PS2NJUokqEhPN46sR0tzD5X4RXZghbXvwgDlWbjHY=; b=37bU7f0vCp9IW4iF13W3hDZYUn
	vzzTa1B1BWo+40YTHzMvXVAE5iuIytzUiry2ThGCS3kOmWT3C1Wrj7t6+Wj8SzeGI/GULvzYTv+a5
	eDictIcdCPKqOMIHNN5zowmvKEYnhMZA1B1iZJUHqOj3WcT/R8EeYjLh1fsLoGwgboGMDo7SMzMF/
	1aRCQR93qhr58Tl0UYCkqm4BhctXFjc4xk9nl0ILeEqD49k+wtuYr81OnObWn8vituaB5fnT3HkAb
	DXSUHnhKRBboSLlutg8ydCRXPrwpXm6N1QiyFMP/Lwf97NZ/dAxlJTqMTKIiehWl4fttkSP8rYRUx
	rbDcEb2A==;
Received: from localhost ([::1]:39048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOzDI-002viA-Ci; Mon, 28 Oct 2019 07:13:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iOzD6-002vi3-7n
 for samba-technical@lists.samba.org; Mon, 28 Oct 2019 07:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=z2PS2NJUokqEhPN46sR0tzD5X4RXZghbXvwgDlWbjHY=; b=ln67IOxMJoSChSFyqOmkI0t6cW
 MYdz/F+yq3afZ40bIwSKaTIAY39qPsnlvNvLyVPIADMTX+Ved/weJRT8gRAyOiQpqpXfFtXe/zbMu
 mRXuP8lBTiSuXLwbqQf2Qq8Y2l5zLamswIMVedaMqwstNDbHlPCsrWRENybq2XYKOzz1ZzaQf1mm6
 LTO7X9QWt6o8rTwVJFNJZOOuEbTU7ipo3ewHb5Ult5RTx1YlGIuHM3ZVJzsGtYC2Q5RJdi8QwqDdx
 xP3rOMHHqrkSjmt5y4PRRUJJYofX8pN7ML+Hky4v/X2SencX+/HvBE/jvcrpl6C5tVIfL98MhTdf7
 OmshFNGbSa00pXxm7ZMLKcsg4LxNuq87KumwcKKSJewERjdCtX5IxbvEZcYFCp/lLjcz2ZLRvxMKt
 E64fYgVsy6pqw3sa01fHPFmUt95Cy5k9i2/9CBt0hW0rDTyFcN29iwGc1ihgd6ho5F3MV1tEa/hb2
 xOWO5HIivxdnPpHR8Rj6TVD7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iOzD4-0002kR-Hd; Mon, 28 Oct 2019 07:13:02 +0000
To: samba-technical@lists.samba.org,
 Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: Automating usage of smbspool_krb5_wrapper
Date: Mon, 28 Oct 2019 08:12:59 +0100
Message-ID: <2538732.qaAAVzzFgV@magrathea>
In-Reply-To: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
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

On Monday, 28 October 2019 07:32:13 CET Mikhail Novosyolov via samba-technical 
wrote:
> Currently there are 2 alternatives for /var/lib/cups/backend/smb:
> - /usr/bin/smbspool for printing to an SMB printer
> - /usr/lib(64)/samba/smbspool_krb5_wrapper
> for printing to an SMB printer with Kerberos authentication (e.g. inside
> Active Directory domain). It makes use of Kerberos ccache of a user who
> made the printing task instead of ccache of ldp daemon user.
> 
> In Fedora, as I could understand from samba.spec
> (https://src.fedoraproject.org/rpms/samba/blob/master/f/samba.spec),
> package samba-krb5-printing has to be installed when it is needed to
> switch from smbspool to smbspool_krb5_wrapper.

Samba only provides smbspool and smbspool_krb5_wrapper. Installing it as a 
CUPS backend is done by downstream, e.g. Fedora.

You should discuss it there. However there is probably a historic reason for 
smbspool_krb5_wrapper being in a separate package. Maybe the package could be 
installed by default or as a recommondation.

So open a bug downstream :-)


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



