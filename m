Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9712138E
	for <lists+samba-technical@lfdr.de>; Fri, 17 May 2019 07:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gkMOiMCDW++/yFU5fVPEElnRk9d3nwZZ4lJULXVM5GY=; b=YOTNxyJzy8GQ9Zm56myxKarZ3c
	oxUmwkXuSErgZJnjoLH+yEl0Epe6IAK9/AjlwOut6U+45Y5+WkRJ9wKBWGfxPjoO+e35dHhaOzQrp
	n9lNk2PcLYJn1v1DUa0MF1Lvpws6Q+tTFXySxgOYeP8XuzMrDGjIWqfDL8OJdJ/wzDeSyZEwhMryZ
	+BJu+qauVDKlwl1NCHCmh6LjF40PDxunxOMuVlZC8uBHE3i4u/PYExd7y9Tn0LBT114LGwZU75Bm1
	mYQdi8Ea6yvHGjJOGkIwAgZX0J+4yjB0/9UZT2J4lD+cGwz34SR+v76botV16QFVmfhAlC4W6ZAtB
	imJi1yRQ==;
Received: from localhost ([::1]:61462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hRVt3-000DBq-Ef; Fri, 17 May 2019 05:58:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:22006) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hRVsy-000DBj-As
 for samba-technical@lists.samba.org; Fri, 17 May 2019 05:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=gkMOiMCDW++/yFU5fVPEElnRk9d3nwZZ4lJULXVM5GY=; b=evb09SzKGcfhN2/PAMc5isU5II
 XxNE9T0WFXKCIvcBp/WS2OtyLYD/7N7ip7dD41eM0eSlUWbP0vID7c6WmLmnTVJMZekppWZgbN6I8
 OpBqkuHCWbcCRgbt3bwXAIMBgz3yr8LgOyhiNON2dplShxOISg8fz2rF0PFWe+H8UXHo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hRVsy-0007n9-08; Fri, 17 May 2019 05:58:28 +0000
Date: Fri, 17 May 2019 07:58:26 +0200
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
Message-ID: <20190517055825.ncawg2sswy2lgvs5@inti>
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
 <20190517054426.aoyovsk4cwsse2li@inti>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20190517054426.aoyovsk4cwsse2li@inti>
User-Agent: NeoMutt/20180716
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 17, 2019 at 07:44:26AM +0200, Ralph Boehme via samba-technical wrote:
> rewrite as:
>
> SMB_ACE4PROP_T hidden_ace = (SMB_ACE4PROP_T) {
>         hidden_ace.flags = SMB_ACE4_ID_SPECIAL;
>         hidden_ace.who.id = SMB_ACE4_WHO_EVERYONE;
>         hidden_ace.aceType = SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
> };

s/;/,/
s/hidden_ace//

:)

Not sure if the nested object can be initialized with a designated initializer, 
iirc no. Then move initialization of who.id out of the designated initializer.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

