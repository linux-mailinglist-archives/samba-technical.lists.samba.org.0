Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3AA8244A4
	for <lists+samba-technical@lfdr.de>; Thu,  4 Jan 2024 16:08:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=s39CclfIh3cOibEh4DUdQ/ZgvYejA1PoJml0gwdxJt4=; b=vuYtf5YGOmDPDjO/OupX2AWyFq
	y15shf1pFn3/PxJG3vMsiToQv/9kXATRLDPkP9nGLsufQXvFlW+L4SPQfejNhR2JvdMqZB1xAJvd+
	y3X/qliah00PJ3gcHxESIU7aoS1CLomigV09+eTClj43cYaeko8KDjdPislJea/TEau7gbHy9KsFf
	sI6dWetKgAWXQBQ5+fB2VsDQP7DUvOlGnWotsnyUkLO5M3aB//5sBlPMkuRSsIJTp9lCl9rMX9muZ
	eSC1yC6BLRZy9frujIr3BnxoYbgW9Dnn0mwQhGELZSeZW7wRQiafxoXW+fr1fAHtlLKnjZ1e4kzFu
	BHt5LLqA==;
Received: from ip6-localhost ([::1]:38242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLPKv-002NzG-7A; Thu, 04 Jan 2024 15:08:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37850) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLPKp-002Nyw-F3
 for samba-technical@lists.samba.org; Thu, 04 Jan 2024 15:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=s39CclfIh3cOibEh4DUdQ/ZgvYejA1PoJml0gwdxJt4=; b=VUAKTOFF+uCRaz239iJEAaeo3E
 yuBwyv9fERPDBsx340oJ3JdtKh5qGCIpw4LTq9/9mIPeHwcCwu3MQeu6hbgSQVRIZrhSOJke4c+Vf
 J4Zp9MtVPduam86+Dc6F4Hdw0h+kmH1REHflYZT/eX3aXwwNvXM80j6tgS3PuDLiyKW07FEe8E87F
 YbrkO1LQbxkVlylIOCb0SFXO7C/7oGCpDDqvPrv+JTWHaL0BRCf1/Bpd9vBGHxoF8INSUhGCGJrlW
 Zqc318RbDOKpGM/4GAWvzoNFcYzuziN3o7hfebZsb9/WZVr1m7iPUUr30LEzUG4Gl469EmgFZjmlq
 wck1thPa1b/8NWXHj++kup4TILYUjPfU7Ug7XWK7blpzly4dnE4D/+188OiRZzD26nIRVXpjKv3z0
 cPhTBht3hdr0+h7BG1nSBYeAM1XYWrkn51RQcnF2ng17M7Fy99P5ZaYx5ep6sndRFL1bYuB5BjEMK
 bc4HJC88hrQAwhfNNJFahc8O;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLPKn-006RzZ-1K for samba-technical@lists.samba.org;
 Thu, 04 Jan 2024 15:08:37 +0000
Message-ID: <3d4987c2-e50f-1e93-bf59-21d349923b2e@samba.org>
Date: Thu, 4 Jan 2024 08:08:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Group Policy Ordering
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <8fde5c31-92cb-4f66-a2d1-95f7ba4e7f1b@app.fastmail.com>
 <ddf5ae2e-0bb0-825e-5dde-67003aa419bc@samba.org>
 <cbff5f90-ddd0-4f9d-968c-b4a1344fd81a@app.fastmail.com>
In-Reply-To: <cbff5f90-ddd0-4f9d-968c-b4a1344fd81a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 12/27/23 6:03 PM, Joe Dillon via samba-technical wrote:
> Out of curiosity, why was the work to apply .pol files to samba's 
> registry not completed? Refactoring time/effort? Or was there a 
> blocker that couldn't be overcome? 

There was a significant amount of work that needs to merge in order for 
the python Group Policy code to access the registry. Here is the MR:
https://gitlab.com/samba-team/samba/-/merge_requests/2416

I think that work was essentially complete, but it needs rebased and 
possibly more review. I haven't looked at it in over a year.

Afterward we have a significant amount of changes that will need to be 
made to the policies themselves.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


