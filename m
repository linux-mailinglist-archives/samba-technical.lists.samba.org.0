Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 151CC275AE
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2019 07:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6xH0DXxgwtxe8drtzWdiTfxfab3CXSEXiInGb2a6UwA=; b=ZlMGcaro15JGL/FWTRl9TDvDiH
	be4kf/fGHq3EF35Rvw3Kk/ISON91OJpS/WvARJ+FbvATDxKbfBZIbpzjUeRasC4glPAEem0PPK7Mx
	54doCEPOy7jWgRFvu8L6O4h6wIbkozmDueUrJ9y7USbTkVQJHf3OClF+0kZWwBJjTGPnJDXz7HtPZ
	MsLTd8uqEb+2XBGjSIWwz1PNShUiMYe/1KX1d7KceD1MfY0suhaQlXNOTC6U025LoKmYKLHiHlJwj
	eHn7KDyP9eLeJvWuEmPatr7j9CZLEUiu006B8/FgMNLY4PUepOZgdb5JWfLh/sr/Uq8qdFO3GmPVV
	MKvMPOJQ==;
Received: from localhost ([::1]:28728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTgYX-001O9i-KO; Thu, 23 May 2019 05:46:21 +0000
Received: from [2a01:4f8:192:486::147:1] (port=42512 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTgYT-001O9b-73
 for samba-technical@lists.samba.org; Thu, 23 May 2019 05:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=6xH0DXxgwtxe8drtzWdiTfxfab3CXSEXiInGb2a6UwA=; b=fWd3p89ouJjbeC07q+yYcjaTdZ
 Y3eoTqYOF2Z44xjixrghNc6O87FHljC6SENwfjXMaAlOLDQWLjCD4mFWEqoLgsVdpApZ2n2Y4161J
 i7Z/Dije99KGjSRY1CSIvHdIk3ngvTw5gAJKd9bccZh//doAqXnSHOtMmbl/51DQQRzE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTgYN-0004Yq-Ha; Thu, 23 May 2019 05:46:11 +0000
To: samba-technical@lists.samba.org, Gary Lockyer <gary@catalyst.net.nz>
Subject: Re: UBSAN warnings on calls to memcpy
Date: Thu, 23 May 2019 07:46:11 +0200
Message-ID: <1900817.20UiHFBjkS@krikkit>
In-Reply-To: <80078990-84ab-4399-3b61-ee1dd908dc9c@catalyst.net.nz>
References: <80078990-84ab-4399-3b61-ee1dd908dc9c@catalyst.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Thursday, 23 May 2019 05:20:40 CEST Gary Lockyer via samba-technical wrote:
> One of the more common UBSAN errors is
> "null pointer passed as argument 2, which is declared to never be null"

Hi Gary,
 
> These are calls to memcpy where the source length is 0, and the data is
> NULL. Adding an "if (length > 0) {" guard before the memcpy would fix
> the warning.
> 
> I'm inclined to think we should do this, but also agree that it does
> clutter the code. While the call to memcpy should be safe, removing the
> warnings reduces the clutter and makes it less likely we'll miss a real
> issue.

I think we should fix those. There will be other tools (csbuild) also 
complaining about them ...

I would guess that an optimizer could remove that if not needed.


	Andreas



