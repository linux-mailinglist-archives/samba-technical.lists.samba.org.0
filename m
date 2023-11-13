Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E465E7E9CF6
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 14:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MLIY7STdTlhIJTE23QOpf3/k6GZYCkHBAI/6yYcH48g=; b=OZCDaQHcltg9dE9QzVpjEPT8R4
	1zVQZpyAUSPGPNHqYvlBq9xOaSb2Exr2obwg6ujrtwxVfBXvjIyQc7+OpLEqnnThFHHWhcanPajhu
	JI15dsczoIFF4u4IKw+6aDrYtki1ux0JzAPDkcsUFVPSmDsC06X9atkfs32iLWQq5yz1de4JcHUUJ
	wttSJprBf/4HEZpiMBb0JnhfiMn6mfwUVkycK6KidyFrYJCCOYJGOQ59F6boAwIYbmgbSv5cdjnDx
	6GOudzGYspEwK9b5x6DBxPIcR3KKgh9rV6ipwMjNS3tuEL7KrjOCg/3cuxWA1XTGHJR3b72sHDrsb
	6eMYMutQ==;
Received: from ip6-localhost ([::1]:32488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2Wq3-007vb4-BK; Mon, 13 Nov 2023 13:18:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46076) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2Wpz-007vav-1C
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 13:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=MLIY7STdTlhIJTE23QOpf3/k6GZYCkHBAI/6yYcH48g=; b=QcRkd/cdG8DNYSveJ5/DPdj5nP
 VbCI+/75uuLtLH4keMRGQArD0lUAcTDYzbPog9dsR0RBdJSEnvwTWt3zIlrxSlOxeny5YR1JomO3w
 LDE/E3YTl2b0+CUfQVOkyHbgRXT0z7zTj05l6Gi8RnAqNJ48EHxVGAlhProdx9xJCs6nppmSwC4dK
 aqa+aCospYORN7eqWcBuFBWhZsrQ1dx2lCWIRuBzhvfvLluZ/To8mP9qqJY5j4CLiiWUZ1znA+WGz
 m/aEl2khgciWNzzUP60YTYt4xc1d9BmOjNArtyY+4Gurx8jwq9agZObLGyet35SoBMtW/2ejdomq/
 M2GCv4l7DoVS22uXTsMqY10Uj+1GsWB24LI4faryD5p8qI67y6s7UPCeZQaMfdtnDJ2NUExcGGJfq
 cur0PutoyLtJEbb7LwXOt19AtqV5Y3JUQTzER0vMpB+VU90Qx+FRGJOh23R3+dUDtOBTw+HQPqelE
 6XWK4lgXHAQoWXbAtn+1y7OK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2Wpy-005v19-1X for samba-technical@lists.samba.org;
 Mon, 13 Nov 2023 13:18:46 +0000
Date: Mon, 13 Nov 2023 13:18:44 +0000
To: samba-technical@lists.samba.org
Subject: Re: Audit log dsdb_group_json_audit with with "userSid": "S-1-5-18"
Message-ID: <20231113131844.1e590785@devstation.samdom.example.com>
In-Reply-To: <CAOGObpg3sK8soryGdY+BC=TG8=gctm-7gkR0LYxubkFMbGXXkg@mail.gmail.com>
References: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
 <20231113125324.0cf1b58b@devstation.samdom.example.com>
 <CAOGObpi01iUPmGdB-KhjqNo8t0zgVWK8XJzjw8ATBYD0uWj8xQ@mail.gmail.com>
 <CAOGObpg3sK8soryGdY+BC=TG8=gctm-7gkR0LYxubkFMbGXXkg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 13 Nov 2023 14:04:51 +0100
Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
wrote:

> Right,
> is mapped to  'NT Authority\SYSTEM'
> Samba version 4.16.11 on all DCs
> 

Strange, there was a problem where 'S-1-5-18' didn't get mapped, but I
thought it had been fixed.

If you run 'wbinfo -s S-1-5-18', does it produce this output:

NT Authority\SYSTEM 5

Rowland



