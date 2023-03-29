Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDEC6CF0F4
	for <lists+samba-technical@lfdr.de>; Wed, 29 Mar 2023 19:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=d8fLSrIt/HdFPqXmzmHjaKN/csIC3PWYN1Ub76IjT0U=; b=1McV+liPp/TSQANlOQZBEclHij
	W6DiRLJKfQf2KFt7+Yf39SeEasfXBLcfaPVKc9sRcgELcwQrOSqBCcP8/86Kqk53ajbIVc4q4jWRn
	jzgP30k8dgSFJcqEJoEaDAvY0rQLHgu1IWh+icyVQ5Bzh9rhE5JVpT5EL/fICJkZ+aO2YXQad5OGm
	gEMVcXbjlGVy8JX5d/yaUW43WbUjqV10/XLbOjts+hkGGP6irBHYTyWOG3LekkawwSBUv88jyvyXU
	XqxNH+bvwj+O5sOppO9Qa1aldEwGfXNWNExu7RlaOG+V7Y/lq6p2f9/W6ODNHEbBx2xozGv/V/0Oe
	nNa3AOHA==;
Received: from ip6-localhost ([::1]:22816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1phZUt-005fbV-2Z; Wed, 29 Mar 2023 17:22:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21322) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1phZUn-005fbM-Vx
 for samba-technical@lists.samba.org; Wed, 29 Mar 2023 17:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=d8fLSrIt/HdFPqXmzmHjaKN/csIC3PWYN1Ub76IjT0U=; b=u4faM9Ik1LhpDy8/3dtt1hOTro
 3d1HfOOPOgKs/Xemo75/dcRi+/ftTpKrv8A8suodds3Bss2EEkw0UZJmBt8DuRmra+20S5WJW5x45
 e6s4ikrE8emHhmXNMizE3ewuQC58/9Q/AI/LffZHPUllBDavY8gB+61TU5W3Z5w0MPmzKnaqPG4CY
 U80C/6yfaM20FlzWqwpT5kKnnGmJ4VQ9DrLJQssi8wDcdKeV0SFcurfU8pIi/H0bd2DWNRX+GKQih
 0r+2Yg6GndKgPA174w+5n3MJBmr3Y9jDTsLlDslAIVFyTVODYj+Cn6t+wK5SgEA8r8Ak+l34HA1sq
 tXtbiWY9Gy8q+utQvMADdLbQOx1yxEqZA+E4jj0DvpK6JFZ+23K17pQjnffkAc+XmEUhafuLjXPzc
 7XUslq/UfJpUgrtAh2Fhk54LyWC/fWiHM+kYCCF2BvzR0qf8ZjeVjMoDqym6LtouMsPr4HXLpY+ZP
 LoJLADxtp6xOryIV6TgwEiEZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1phZUl-0067Cw-PV; Wed, 29 Mar 2023 17:22:00 +0000
Date: Wed, 29 Mar 2023 10:21:57 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: smbget cmdline interface
Message-ID: <ZCRztf6+I7s3tiYw@jeremy-acer>
References: <4486220.LvFx2qVVIh@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4486220.LvFx2qVVIh@magrathea>
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

On Wed, Mar 29, 2023 at 09:45:39AM +0200, Andreas Schneider via samba-technical wrote:
>Hi,
>
>our smbget utility doesn't use the the common command line parser. It
>implemented an interface on its own. So it wasn't able to parse UPNs or
>DOMAIN/user correctly.
>
>I've fixed it with:
>https://gitlab.com/samba-team/samba/-/merge_requests/3005
>
>However the question is if it should use the common command line parser. It
>would break the command line interface as several short options are already
>taken by the common command line parser and we could only provide the long
>names for those.

+1 from me on moving to the common command line parser
for future Samba releases. smbget isn't widely used,
so as long as we make the changes clear in the release
notes I'd rather move away from custom parsing code.

