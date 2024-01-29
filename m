Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C157F84024D
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jan 2024 10:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xHZnyFjxmBghoQ6lRHfgWcUkiOTQ/70ophArvCacXDI=; b=d6jX/T1oM+217NP5UaMX03RLNG
	D6UEYBxsWv9pkfPh4gQFxLnX4w+ewU17djKSNJ1rBKguP9JUzXvEtLyFPhyFdaTWKDO3q9W3fY5v4
	hfG9kfdF/9CczyK2na9cCOzZpCTvdorQDGDAOroNtmwce29O2tVJrafCgstygQdZvdRCnTU6vpsJQ
	XzVd3JEuxmgFbR00FvhUb2FRoahuSZAIoSKntmuczzaolc9DNcqD4cnFKAC/dVM1yTpGfAygrigMO
	1ZeYfxDEIstWywNeOLseCZrmK/vhc2F8GrVxVLtxW9VEOLz8HTh82YVtyxoXLWOMTmhGONgxFgFnc
	JT6fSbGg==;
Received: from ip6-localhost ([::1]:45060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUOMC-004tUp-Jb; Mon, 29 Jan 2024 09:55:12 +0000
Received: from mail.tranquil.it ([2001:bc8:392f:101::20]:55500) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUOM5-004tUh-Li
 for samba-technical@lists.samba.org; Mon, 29 Jan 2024 09:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tranquil.it; s=mail;
 t=1706521039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHZnyFjxmBghoQ6lRHfgWcUkiOTQ/70ophArvCacXDI=;
 b=V5KOnviIXNDL5mqtclcjPAT/UPWFcZ7gGEDru/Zha8Ey4ovxIAH9e9GwSJXWUYADZfTOsD
 Qr10LFYBQwKadDullxpoMMFfhy4LZQKzgT2XyMgRKPWzbA1qNOZ0MdbnlhPSN5ZKyX7Pl9
 qDurdEWZi6EkIriFLGE7bFcPx724dZ3TqqB2Zs4OQqHACymyXYMR6gvhfCJ2z42eeXvPU/
 b3Ta5alThOCogcdWTuuzKskxUuIMIf3KSnfQVUtfwYjOqiZlL8Yn0isL13zz0K9dALw1oN
 BjCk8XeWtdn4L5hApSXfqE5eudX8wn1TErwjwItpamas4hM975eCcosNQbwoFQ==
Message-ID: <b168d73e-2375-4289-acac-c467c58eb479@tranquil.it>
Date: Mon, 29 Jan 2024 10:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Azure AD (Entra ID) join specification
Content-Language: en-US
To: David Mulder <dmulder@samba.org>
References: <c2139c3b-678d-55b7-4ec4-88db5215c487@samba.org>
In-Reply-To: <c2139c3b-678d-55b7-4ec4-88db5215c487@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail.tranquil.it
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.09 / 25.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_COUNT_ZERO(0.00)[0];
 ARC_NA(0.00)[]; FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_ALL(0.00)[]; DKIM_SIGNED(0.00)[tranquil.it:s=mail];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 ASN(0.00)[asn:3215, ipnet:90.115.0.0/17, country:FR];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Queue-Id: 4E5848182D
X-Spamd-Bar: /
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
From: Denis CARDON via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis CARDON <dcardon@tranquil.it>
Cc: Simon FONTENEAU <sfonteneau@tranquil.it>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,

Le 26/01/2024 à 17:42, David Mulder via samba-technical a écrit :
> I've made some minor changes to the join document for Azure AD. 
> Specifically, there was a major mistake in the TransportKey definition. 
> If you're working on a join implementation, make sure you pay close 
> attention to the changes. Azure accepts just about any blob in the 
> TransportKey field, and doesn't perform any validation on it. This only 
> becomes obvious when future responses from Azure are garbled nonsense.

I guess you are trying to look for a pure Entra ID join, but if it is 
for a hybrid join, my colleague Simon at Tranquil IT did implement it in 
our pure Python AzureAD Connect implementation [1].

We don't use hybrid join much (our clients use WAPT [3], not Intune for 
device management), so it may not be complete, but it did work when we 
tried it for basic use case.

Be sure to use the python-wcfbin from AndreasLrx, there is a bug in the 
upstream xml binary library to communicate with Azure.

Cheers,

Denis


[1] https://github.com/sfonteneau/AzureADConnect_Samba4/
[2] 
https://github.com/sfonteneau/AzureADConnect_Samba4/blob/main/libsync.py#L233
[3] https://www.wapt.fr/en/doc/index.html


> 

