Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 092799C2E70
	for <lists+samba-technical@lfdr.de>; Sat,  9 Nov 2024 17:18:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HD7YyLMm4RkwJ8+EBV4vUexPHQXERT7ftRZ2ELevSAs=; b=ihCFnboMbSoNRj4h+Ud+rbpnIA
	GeCX7rM4+YvYTmIY52X9rB98h4VYJ11uoaUdd7nyl8ES8wzn/HqA6DIv5wJ3tbdHuYRTnUmuh/Nbx
	FyBFy9feuC4CwVjwdO0S7CDELqJ2qIminR0jOF61K41GQ27AQBnuH+CcGIQTwIzAWw3VTvkIkC9Zi
	P8awSBFkTw2luImw4SfHmlYuP9DqV5sq+H0fW0n7MnbYZwwtApPI9IO70gAvsNJkNawPd3IjC/xNR
	+I/Gqb18viFM20/Lq7Nq5QMc83YHt0BXa0tZSCqw6yAgxb3TbOFWuVO33+2VcLwShoHVxKGmyYRSR
	0H+XM5JQ==;
Received: from ip6-localhost ([::1]:35856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t9oAM-008Brk-OB; Sat, 09 Nov 2024 16:18:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48458) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9oAI-008Brd-4U
 for samba-technical@lists.samba.org; Sat, 09 Nov 2024 16:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=HD7YyLMm4RkwJ8+EBV4vUexPHQXERT7ftRZ2ELevSAs=; b=Q4MubUFetVE8bWXJ5lEzaXpIkF
 fyC0+QM/X55GUiefb1nthkInNXtpYZgrD7vd/0uQyhQYDw0sO+SSY7mIsqCHd+yqOryrfTeknlWvJ
 s4MRQWTGHC+WyIG+L2aYA+zXGoqe3EOjtiQgX2lTt5YZ8G1HXdg4BefV/+gjijquC8LBS8in0vjPG
 qfiOT30JvByv2DN6vUQJqiJOVLYT/aIoVNSG8vNJ6MeKFR+rAovZ4GTGn/k9Ktob64rP132I9MHs2
 BIFj3JRzMwAFF0B/B/yu96KuspiXuY70gtnML2nu5fuVD+LhDRqdRgm8Y+pK/KoCW9MW+BUkXI4sd
 ZJhXuB83NunSSacbIRNRUH6gn5CHHcSgXPI1w2rbULOj+Y8HiUo3BWoV8EDEYlsz3L1H+zAvXkqzv
 FXTFd8DLDbFB/SDznRoVyfNVZ7imckq8f7JwJn7pODM4ENOVYoLmQlVLiVzW8a7D2+QoT9YzeJX33
 g5ZkVtVuiOnQuTj0XAcLUVDA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9oAH-009nLP-0H; Sat, 09 Nov 2024 16:18:21 +0000
Message-ID: <2eb2e4fa-1e74-46d4-a399-0200dd08e348@samba.org>
Date: Sat, 9 Nov 2024 17:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Jeremy Allison <jra@samba.org>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
 <c146a052-40e2-4d90-9a8e-9236a0b2dc20@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <c146a052-40e2-4d90-9a8e-9236a0b2dc20@samba.org>
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/9/24 4:26 PM, Ralph Boehme wrote:
> On 10/9/24 9:43 PM, Jeremy Allison wrote:
>> Can we just map (access_mask (FILE_APPEND_DATA|SYNCHRONIZE)) == 
>> (FILE_APPEND_DATA|SYNCHRONIZE))
>> to O_APPEND, regardless of POSIX mode ?
> 
> thinking about this a bit more, this seems doable, albeit only for POSIX 
> mode. For non-POSIX mode we could potentially break WIndows application 
> that open only with FILE_APPEND_DATA: I checked with a torture test that 
> Windows doesn't enforce append behaviour for FILE_APPEND_DATA|SYNCHRONIZE.
> 
> For POSIX opens we should also allow combinations like 
> FILE_READ_ATTRIBUTES|FILE_APPEND_DATA to map to O_APPEND, so clients can 
> write in append mode to the handle and still are able to fstat() it.
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/3863

oh, forgot to mention that this fixes the failing copy_chunk copy from 
the Linux kernel client in posix mode.

-slow

