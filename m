Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EFBA32F29
	for <lists+samba-technical@lfdr.de>; Wed, 12 Feb 2025 20:01:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uKYsiO3FRMAiJG9K/8Qik089IFUx38tanVvAjyQdcl8=; b=hiOSpelf9FGLuC5QhwawzqnMCc
	sqI/YzmYRa/7kSrDFlHofZBe2IpgBsUe33saTObdZQExYqwUkfQqUj9j83Ilwb7EtUF5fC3JFqyOG
	xrSoSIuvXq6JgPenZPmELbnrK2KeGS8OrVx9sy8pThHAgIOjxMwcMqcI20DAKE+7/e5TMusEzrIDB
	YejAKmV34OTxQyyXg+4BmwleBVBc2jt3jbHkAP5J/0pWqv9DughJhs95AwHmxLb+2jYFfQDRf2LgE
	nt5S3olfDiq5K8/QDS80y7bVPzw69OuduLm29RiBInF3D+Ckc9cb6cV0AVSRnZ1/OniD+BG7r/1KX
	jMYMMyJQ==;
Received: from ip6-localhost ([::1]:20140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tiHyj-00CHLm-BG; Wed, 12 Feb 2025 19:00:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31400) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiHye-00CHLf-7H
 for samba-technical@lists.samba.org; Wed, 12 Feb 2025 19:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=uKYsiO3FRMAiJG9K/8Qik089IFUx38tanVvAjyQdcl8=; b=MCc8ggEM3q/Xwt2/0TX/vtAQWr
 PBTcWpsdjiFv33wtLIbmjeEDOIHEzFeu3zPMMJYW65+vPUlhSW6Tw9ciLYNgcFyBCy1ZxnZyhqQln
 knxVQF9fS6mjrIxD6jCfZAQPUD4D/4X+QfU3+Cq/warhKH5CyKOQph7rePXWA0UOZtIvo0nvdv1UZ
 ox5/vdjN9XtpHybgdz6pXUTjJv6yPzMvaYlOKWNwVAM37mU8L/vQTxx9h0aninyDZh8KGy7zTvoua
 skeyVfOwmstq4K696lrdbeTFS//E+KhtMCHdjxsD+47mdvc2qqeOHOpNSqmfD0klM8RwPZEvtqZ3d
 t/36rKrCsUMN6JR0pjzJ8tF1A68xEw77ps+ZKlOg/jc0zd+VTfxnQgyntFExTEtzraVBJZtgCZv29
 l6WpV72QVeZNRgZMtE/C9zHWcSoMiBSZayAjCps0gvNcvF+7YFBcmFVTUTPWlllFzN/ITpgOmaz8u
 Pn2FIC35fYvYWLAmgITSxYVu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiHyd-002FK4-0d; Wed, 12 Feb 2025 19:00:51 +0000
Date: Wed, 12 Feb 2025 11:00:48 -0800
To: pb+samba@arkthis.com
Subject: Re: Reading >4kB xattrs (from ZFS) = input/output error
Message-ID: <Z6zv4Nsor0hyD1DF@jeremy-HP-Z840-Workstation>
References: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 12, 2025 at 04:38:40PM +0100, Peter B. via samba-technical wrote:
>Hi everyone :)
>
>I've recently set a >40kB binary metadata as xattrs on ZFS, using 
>`setfattr` locally.
>Works fine, and I can read/write data like that without issues.
>
>But when I try to access such "larger" xattrs over Samba using 
>`getfattr`, I get the following error:
>
>`getfattr: bigdata.test: Input/output error`
>
>I've tried increasing the log-level on the server's smb.conf, but I 
>couldn't make out relevant information telling me more about this.

What does strace show when reading that xattr ?

