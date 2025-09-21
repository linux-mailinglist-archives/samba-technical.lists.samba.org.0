Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CFAB8E9AD
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 01:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xFURZj2JBALq5mslasr+xbl+ozyCNi3+Ce7Gvz97ZFo=; b=uximg751Vwnem6rT2iN/4UQJJJ
	VqFwuKDIWJ9x/cNitPJJAtYer+MYc3g0Wwzx6oMlbi/85D95GzLB4bWYk7lmNkEuF1gvLzbaTzd2R
	KL45A+LJhviRjmqW/gXmzqPz96xv+BvhZkuCXU4/W49zjp8V+72UnmP5LXNj0BWVQIbgzL7AJN3Y6
	wkg/8uK15z4cb23FqwMvO6X0/RNkVJ7kITvtP/cUOiNPkYPFnrXpKXJfjPnNU61khVT4WIt/Oc/rG
	Ldm9lSfwuwFTP2JAbEO0t10dIF7m9L9YhuFIbboQD6NGtjV9z1Z/RN16aqRiuzxkFNzssUCc5ivmj
	bIvZsX5A==;
Received: from ip6-localhost ([::1]:55096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Tkx-004Ug3-Rl; Sun, 21 Sep 2025 23:46:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56492) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Tkr-004Ufu-MF
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 23:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=xFURZj2JBALq5mslasr+xbl+ozyCNi3+Ce7Gvz97ZFo=; b=wnEBrsOIL4pAtoiZm0bv2+dpV/
 hyFGLbDjpqUCd3TDxHKdNOX9v3EaX3ssbZoOtg9zWTg6/oWwm7NVgsT3Un66r3CB7YIusvlURkoeb
 1W0xJCTh5ea8+llit/AjX7fCPDl47cnpFnq67piJUDnn6ijzG6Mr3o6JblZZP9KS/hpu4UuQ6GzAG
 yV9iyBaPdX+CNIwPb2p0STx+SpiCZWjEuN2Q08tiw5eGTrwO6DCxYV669AlMgGurMG19JzLyyRL3d
 YE1P2vBAQpHiqjDZvaYzYSoR27Q6jI+XX0RifSDbxj2L23J3GeQ73lSu2bZJPjTeR9Ryf1+tgGZSo
 7c/xM3Nyc/BlxPYEm1XTSmYwie/0KPb8avJd3nwG8DJUkpDB1NcFDze3sRfHhQpo4C3KjrDcF7WGx
 5X0VIXETds9FfWe8WzCy7M32g2VXtmkV8HQjTq6Z6F+1h3c8fCDnrMJSoHaQDDxOpxQEVmFFRF6NW
 jKoV+s/albfusViQwvOuZoe6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Tkq-005Hef-1A; Sun, 21 Sep 2025 23:46:04 +0000
Date: Sun, 21 Sep 2025 16:46:01 -0700
To: David Howells <dhowells@redhat.com>
Subject: Re: How to cause a multipart SMB1 Trans2 PDU to occur
Message-ID: <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
References: <12788.1758471560@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <12788.1758471560@warthog.procyon.org.uk>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Steve French <sfrench@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Sep 21, 2025 at 05:19:20PM +0100, David Howells wrote:
>Hi Jeremy, Steve,
>
>Do you know if there's a way to cause Samba to generate a multipart SMB1
>Transaction2 PDU?  I'm trying to test my revised reassembly code - but I think
>there's a bug in the Linux cifs filesystem here with respect to signature
>checking in such a case.

Samba client code smb1cli_trans_format() will do this.

You can get to this via:

cli_trans_send() called by many functions inside source3/libsmb/clifile.c.

You might have to tweak the sent state->param or state->data sizes
to cause it to generate the multipart SMB1trans2s call, but it's 
capable of doing so.

