Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FAE664F21
	for <lists+samba-technical@lfdr.de>; Tue, 10 Jan 2023 23:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=AzXq+ISYIjWZZmXVQUZLqE4+WgDkBWQhLm6wEx/1YnY=; b=qtz/HQhLPQ0zm0cMVBj3gCZMT6
	iytS8XQwiU+v8UBr1G99eVhRQiVcjasvZgfsTWZW1fvddLT+5dLzjo2fFqpR4wq0feQFc60KIngbP
	fVCuL7kjxtorK4b8J9MtxPwcoV6fEv8IWAA4Qn8WgJ+pdAxokmR/8BsBlpqBFAEeCx75tp8WUwgW8
	KB6doGcJceisKlKnV4i7Rsd6SKKDaLH+v9/dS31Nas2PoCdfKr9vnMX0sdsZAgdfuznYwMtBD7yfW
	uqrtzSU5l+SJWTQoVTLamrdzyqja6JGYhEo0NlQXuqBncs1RNlsekinmgObFSuGpt7w6oBKVosVQA
	nspsvX9A==;
Received: from ip6-localhost ([::1]:60234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pFNUA-00FmhA-44; Tue, 10 Jan 2023 22:52:50 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:56158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pFNU4-00Fmh0-HW
 for samba-technical@lists.samba.org; Tue, 10 Jan 2023 22:52:48 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 05C6581F58; 
 Wed, 11 Jan 2023 11:36:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1673390201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzXq+ISYIjWZZmXVQUZLqE4+WgDkBWQhLm6wEx/1YnY=;
 b=YaHnouCIIVjkjTpvlgA4J1rcthUOqZDh60MvLdfjoQW4MfU/stZDjmRY/fFmuqndn7CRtM
 w0fs+9MGXVMAFn7nfnKkyHq9GCB+xiZ94J8wA7jDdZWj+UiWCY58HI7tMJ8r6Tgcia7P5R
 rXpJMDYvKPSPmXeFkDLB9UBez99/qLtEG1VEP4beOSszpSOUrIVK9Sdxd0AAvLiZizQdXD
 BZZjeLFoWcGYhTEKIVTNSYDszczJnM/tna+0hRx1pw/+mGp9CgmCkD7CnR4RGBBCHnlkL/
 Nks4mKyhgtlWKYTJMNk8/mpbLdBnIugSWvzXVjLtbq0J5x8yCJzWGf9dzOt6/A==
Message-ID: <fb6e0c03-65a7-a281-862a-fd18b3a6de1f@catalyst.net.nz>
Date: Wed, 11 Jan 2023 11:36:39 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Does samba provide a fuzzer mode that uses deterministic
 NTLMSSP_Challenge, or how can I bypass the authentication stage?
Content-Language: en-NZ
To: fouzhe <862006904@qq.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <tencent_29DC40253F02789FD0BA47569E86E92B6205@qq.com>
In-Reply-To: <tencent_29DC40253F02789FD0BA47569E86E92B6205@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 FREEMAIL_TO(0.00)[qq.com,lists.samba.org];
 FREEMAIL_ENVRCPT(0.00)[qq.com];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Fouzhe

> Recently I want to fuzz samba systematically (instead of functional fuzzing like OSS-Fuzz/samba). However, the fuzzer acts like smbclient and needs to establish a connection with the samba server via NTLM authentication. The NTLMSSP_Challenge sent by the server is not deterministic, which can render the fuzzing based on previously captured traffic futile. Does samba provide a fuzzer mode that uses deterministic NTLMSSP_Challenge, just like boringssl does (https://boringssl.googlesource.com/boringssl/+/HEAD/FUZZING.md#fuzzer-mode)?
The short answer is no, we don't have anything like that. It would be an 
interesting addition.

As mentioned on the other list, I think most or all of the randomness will be 
provided by gnutls. Perhaps it all comes though the functions in 
lib/util/genrand.c, but perhaps not. I am not very familiar with the NTLMSSP code.

I am also not aware of what smb.conf options might achieve this:

> The another way I think is to directly bypass the authentication stage. I tried this but it didn't work. First,&nbsp;I started the samba with the following config to disable authentication.
> ```
> [global]
> &nbsp; &nbsp;Map to guest = Bad User
> &nbsp; &nbsp;ntlm auth = disabled
> 
> 
> [sharedir]
> &nbsp; &nbsp;path = /mount/
> &nbsp; &nbsp;browsable = yes
> &nbsp; &nbsp;read only = no
> &nbsp; &nbsp;guest ok = yes
> &nbsp; &nbsp;write list = all
> 
> ```
> Then,&nbsp;I used smbclient to connect the server via `smbclient //172.17.0.1/sharedir -N` and captured the traffic. However, the auth stage was not passed as shown in the captured traffic.&nbsp;
> 
> 
> What is the reason and how can I achieve the goal?

It strikes me that the client is the one with the NTLMSSP_NEGOTIATE and user 
'root'; maybe you need more client side options or a client smb.conf.

Also, it looks less like the fuzzer "needs to establish a connection with the 
samba server via NTLM authentication", and more like you just want it to get 
past this somehow. Is that right?

And having directed you here for the fuzzing mode question, you might have 
better luck on the Samba list for smb.conf/operational questions.

cheers,
Douglas


