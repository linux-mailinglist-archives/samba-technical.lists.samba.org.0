Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B499167EDF1
	for <lists+samba-technical@lfdr.de>; Fri, 27 Jan 2023 20:04:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=N1A1LUtQhToC5Ck7HxjEo1XP5mKX3dxXDmeVs2Jl7So=; b=iOqCGQXl2MAFerAfv7mKz+LXsp
	wEa8ucA5EgesM83EsLdW3KvnWFVbmNR/j1s9GsVbiImdB+0CxCRtvCxS/OR4s4XzzvPcJsf6D3kKL
	RtrH+9K6N2mX7CgxQoOZ0RjY2zKAv579M+mOyoHiLvpK6OQb6bNPVJ6w6slYfrYpYuCju1KXEgLxR
	g0YaEzuJ2SOMp9Swj3cLOfWPHVVKLPhs1Z1/tklpe7nq2nJl2N9f0wr/IyVcyl4B5SPQ0DzH0AQj4
	MrQVLY8CR5qbPm8JBVar0hJa8134ey1XoG0dFrcOHWhwES58vAnXe1ijb7DmEHcPmkzV9pb/YWTOa
	AhgGWqsw==;
Received: from ip6-localhost ([::1]:43312 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pLU1I-003mgC-PT; Fri, 27 Jan 2023 19:04:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pLU1D-003mg3-Jm
 for samba-technical@lists.samba.org; Fri, 27 Jan 2023 19:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=N1A1LUtQhToC5Ck7HxjEo1XP5mKX3dxXDmeVs2Jl7So=; b=Iqiu1LOnk4ld7oDI2ptLffK7cL
 VqqR1dSbNi2X7RnDFDaQknx/eWIkXnrbWhVCYe9QletChpKOiCy7CLwVwvHaNM5LFfO7boF/hEz33
 qumhfvBAnWWFhB1jie72dQjil0L4ioxqdq6bY69pYJZSNiZ8iQX5n7aJrnRi7DvE3N3WcSB8xt+qc
 +P3CrEH64K90CsehDfMKEhVVAf2CAo1ajeWoujnrKnJ/2VyrTh6xK3T+aDZ1CAne1sxc1gMl7bw9q
 4+tu7A41QfHrd8L1HCCLHYS/bBqRRVWlpL3XFBO5HsX8VAEJmsjBv9twjohMk4PUeMlupX5cWlwCd
 YKSNuj63iEZjWWXmT1AALlsIPcKOVs7ExVTYhePg5Ny7Ilv9oNc+hoU4TsRNXa+D7xTrcu3gqH9Ee
 Q3gzvWyGwjxv5VtYR7wVuj0bqCLk8AhCTiOxL36SEehn+v4oJwIe5CcC0IZ5/tiaxI7YKftJcC1Z6
 UALOi3JekEYsv48xfdyP/kb5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pLU1C-00AXyE-1N; Fri, 27 Jan 2023 19:04:10 +0000
Date: Fri, 27 Jan 2023 11:04:07 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
Message-ID: <Y9QgJwNzUh9EQFQV@jeremy-acer>
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
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
Cc: samba-technical@lists.samba.org, varun mittal <vmittal05@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 27, 2023 at 07:28:03PM +0100, Ralph Boehme via samba-technical wrote:
>On 1/27/23 19:14, varun mittal via samba-technical wrote:
>>The SMB2 spec says that the application decides the CreateDisposition flag.
>>Since the client is same in both cases, is there something in the initial
>>responses by the server that would cause this ?
>
>well, the short answer is probably "no", as CreateDisposition flag is 
>client chosed, as you've already found out yourself. Otoh, *something* 
>seems to trigger the different behaviour and there may well be 
>differences in server behaviour, so I would check everything server 
>side that may affect wire behaviour starting at the top like checking 
>basic configuration down to the bottom ie compare every bit on the 
>wire with wireshark until you find the difference.

Wireshark will be the key. Compare between Windows server and Samba.

