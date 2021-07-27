Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300A3D70F5
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jul 2021 10:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hIBEvO+M36d8GMMA+eBnlTuKSQYGGJ+aEhJsPY/p51w=; b=XyP5Q87HitCaVCyPBZtBATQOjp
	RCfPNTCplMXRBjLAdy/cmSZ6zUdrS3XxWgxcrsKqOMpSLtYsYd27gaII3bccHC34uutV58y7hrFvc
	0xGqwhqM0qvuedRtM0vNVEUwp+kWPLpuUcWHAx03/33coh+/9WARy6P2JeqjPC6+ONDt6IJKPvxZY
	NaszX13JThtABWvnjMYpgn9J61DW5iRIUFePHevr6FIYYj1gzmU9KZMEa4dI48GCRVilHsNWTOwF6
	QymgaxSSKgOFpCQ5OtZMnjEEwDvKDCiCP01SLMjbCECESdAo2DL/sP0aEHzxiFpQ/bviHl4JjlSAo
	lbWE6L6g==;
Received: from ip6-localhost ([::1]:28032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8ICg-0015JX-3o; Tue, 27 Jul 2021 08:12:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29376) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8ICb-0015JO-4H
 for samba-technical@lists.samba.org; Tue, 27 Jul 2021 08:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=hIBEvO+M36d8GMMA+eBnlTuKSQYGGJ+aEhJsPY/p51w=; b=hmz+5QEjQPrd/gF1uEUQZk/jrx
 Qt4EZjUyq7Wm//B5s0BEPS4wYJLjtcYGAipiZ7YhniwnTq2E929iqKM1apxP+OzxdPOOb5doy9IAy
 xFjGFczWGoV2aJ96GpmAhDefuCz56Ft73X+RTNJUqYzs7AMu6sBvLh+KEn0VO9rurz2MdbyyRaMxF
 kh28B+crGqHbkPdVbBXOaI+x62tIL+BD8oO7HNuz7dvK3I8E7PEQJ7zzducq7GEX5wNXxTaIAseX/
 dhbQ2Edt5Pfs/9PcSodLPiH+XyUlxxxfgvNjFWPR3N8ZQF1+5qgC+xF3wKCBFA2enLWr3EB7b/rQ9
 b9Z8nuS0DSUMRp3avN2qmQy00UpkATSRPMGHQ2fFS3kBcnVyNR4P2bvGH7SJuGFpLO6+LrRdEGilR
 GohIss4z/Os+pdLj41WpHqttaYtbVTIP4mjKewguGpU/GbsMs9QVKmoAFUM+lfFzLLKPBt0FPej90
 uk4eO70ex52ul+jLavbezaiv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8ICZ-0006rO-UR; Tue, 27 Jul 2021 08:12:36 +0000
Subject: Re: Is "acl_xattr:ignore system acl = yes" recommended?
To: Rowland Penny <rpenny@samba.org>, miguel medalha <medalist@sapo.pt>,
 samba-technical <samba-technical@lists.samba.org>
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
 <201468d0-47c0-1a5a-efdf-7206e70f7e8b@samba.org>
 <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAGkqX8XX4T5Mg4ytd667iVsBAAAAAA==@sapo.pt>
 <bac38c9b-31ce-a544-e541-ddfc8edd10ad@samba.org>
 <5960b230b312bfbe898b1c9e21140af76135b6c3.camel@samba.org>
Message-ID: <39d50c62-fcce-72fe-e95f-141753411a7a@samba.org>
Date: Tue, 27 Jul 2021 11:12:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5960b230b312bfbe898b1c9e21140af76135b6c3.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 7/27/21 10:49 AM, Rowland Penny via samba-technical wrote:
>>
>> regarding 0666/0777, I'm afraid that's enforced by the acl_xattr
>> module
>> if ignore_system_acls is set.
> 
> Yes, but it very probably shouldn't be

That originates in https://bugzilla.samba.org/show_bug.cgi?id=12181 and 
https://bugzilla.samba.org/show_bug.cgi?id=12181.

The smbd process assumes the unix identity of the user that opened the 
connection, unless, maybe, "force user" is also used. Given that, a mask 
of 0600 will make the kernel get in the way again, so that's why the 
hard-coded setting of 0666/0777.

I agree that we could get the same result by setting "create mask" and 
"directory mask" manually -  it's largely a balance between getting the 
configuration options behave according to their name, getting the right 
configuration by default, and maintaining enough flexibility for all use 
cased.

I hope that helps,
Uri.

