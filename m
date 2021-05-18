Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FAC387FFE
	for <lists+samba-technical@lfdr.de>; Tue, 18 May 2021 20:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=OzNBiAUe2Xj6Ehjxz+nF3aaXjd3JHlknpfwuX/kjxt0=; b=bmLOJnJZL6TkQ8+Q3xz4Te4PU2
	YXfWdm/gTRhVSrakI3MtSKi5e8rQVkIWhpXpK9ov/dfGNmaeSQqnA7sjSOiao0ZtpLRf4ewcjq5WP
	R9Oc9OvAzCpnqwVEq1y8NDN8B112s55dTK9qS9UwiFRtewfZ8tSTqeD+5D3u+XNTnMMRuje4yxkSD
	yKKzYlS512Y9InOmVLepK1+C7KIG/eLco/Gq4f8Yjo+IvszZ8EFoXwl0uDuriO2rXLBP7t19hJ+S3
	NyvxXYpWzUpSjruI6rpAgoizE64Fwe1NP/yv4as6yFnfsDm/NIK6tzjBfanT7dIKodDLyQOzXYJxG
	jDaXg+Iw==;
Received: from ip6-localhost ([::1]:50294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lj4q2-001Vcn-4K; Tue, 18 May 2021 18:53:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57316) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lj4pw-001Vce-RM
 for samba-technical@lists.samba.org; Tue, 18 May 2021 18:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=OzNBiAUe2Xj6Ehjxz+nF3aaXjd3JHlknpfwuX/kjxt0=; b=n00l5BOqTTfG/bqtJpy735s4MA
 AYvRr/fdwp34tlG7sdblgFmm2MAMDjb6BNsQSdc4ArDT3en0vi0NONnIbCNk0ZpuS2u0dmz7wIaaz
 DDE8EF4RuXHrR+dwykB8CcP6jafCzNTLb0l9WUqLtle/YngGvYrPEKKbUlRTqWtSGxhv7YthPeLwg
 6TJGdL7RLCoUEH6jCJsI3S688y1ovU+4I2Xcy7qzu2fXj+4lBRTHYJaJwgUvJZkwHRCZDjadZ+P5z
 szztLOO5CiVWdM77bEaefwSlUOxeAJZTroI7MEIL3seQvUAUQOSmAJ5vx/vpM9DEq9lCB7HCS9OKH
 AxhLiWAaZYl2PEclSUjucltCRCe6wnJeBCFKPnVrgB14g2DnJLUd66VKEpK5oDmr3DmLcqM0o7iPa
 Qm3r9fzAM33kq9jHGF1uzfd/Ld0xJ5X72ZBU8pr0AwCGqsoKOZoIS9/Dwuzku3LhSO4JT4+L8EaOd
 ZrDOEcGJ8prHEwU3MAzAlfuq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lj4pu-0007wb-9R; Tue, 18 May 2021 18:52:59 +0000
Message-ID: <482fc14dfd6b782ec12643f88d4c65d9f266619c.camel@samba.org>
Subject: Re: Offline logon flapping in autobuild?
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Wed, 19 May 2021 06:52:51 +1200
In-Reply-To: <4972011.ALVdVshByh@magrathea>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <2444523.AYHQVFttfo@magrathea>
 <530ded817f79e3cec0561c0bc59868ab193ef1c0.camel@samba.org>
 <4972011.ALVdVshByh@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-05-18 at 18:02 +0200, Andreas Schneider wrote:
> On Tuesday, 18 May 2021 12:45:43 CEST Andrew Bartlett via samba-
> technical 
> wrote:
> > Thanks.  It happens pretty reliably for me trying to push to
> > autobuild,
> > but never if I do a job with --tail --nocleanup to actually look
> > for
> > the issue. :-(
> 
> This is the error I get:
> 
> [977(6379)/2694 at 57m53s]
> idmap.ad(ad_member_idmap_ad)                                         
>                                                                      
>                         
> failed to call wbcGidToSid:
> WBC_ERR_DOMAIN_NOT_FOUND                                             
>                                                                      
>                        
> Could not convert gid 2000002 to
> sid                                                                  
>                                                                      
>                   
> wbinfo returned: "", expecting "S-1-5-21-480866085-778340076-
> 1131398019-
> 512"                                                                 
>                                                 
> UNEXPECTED(failure): idmap.ad.Test gid lookup of Domain 
> Admins(ad_member_idmap_ad)
> 
> The strange thing is that the wbinfo commands before succeeded. I
> will add 
> more debug output and extend the test.

As mentioned, my error is failing to start winbindd.

I think my username is too long (I've had this before), and your new
test environment has a longer name, and so we are hitting the maximum
path length.  This is why jra, bless his short username, gets to push
all day without issue.

Just a hunch, no evidence right now, but we have had things like this
before hitting the maximum length of a path to a unix domain socket.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


