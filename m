Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 657F658AC20
	for <lists+samba-technical@lfdr.de>; Fri,  5 Aug 2022 16:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8NheGy5MR5BzvMaMn1NIAOLX8g6atXWDuTDr0i7XyUU=; b=6PMsuaHg3XO/W0IQPyCXHRpE2T
	tiF51QkZ0ahaQjJJaghJrN3MBLS1GewLlN1bn0puKWikViwzEeXaif0STVp4Mx9GabrD7bH5ZUgtD
	YhjLX2uccvUVtt4lIXRNykdu3dGR3Nic1vFMIjpOI4J2llmIMnK7dAPZ4bqTpQvL7Umk+xlselHQC
	Qjee0wirgOzMg6Bq7sNdaC+SvjP4f3EzDtMvm3/ULIYljm7zLygAYHtXlh+YKDZRXt2XLCqYZy37k
	ctL4xhzzhjA+inBYgsl+itBmnYmI4LJCyZE3h8nhUcNZbkofTEqW7MWP46mDT3OiumMzuYlrgLSoS
	bowjF3wA==;
Received: from ip6-localhost ([::1]:65172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oJxzJ-005fum-9l; Fri, 05 Aug 2022 14:07:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11620) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oJxzE-005fud-4b
 for samba-technical@lists.samba.org; Fri, 05 Aug 2022 14:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=8NheGy5MR5BzvMaMn1NIAOLX8g6atXWDuTDr0i7XyUU=; b=ZdJPYtu4Z6vqX7C6vT3UA0UsPb
 FjlXgztVW7M8QlN9dAT3gGIlR4eyhFGBljRMKxhAW2EaMRxX2dEJkvHIoRUKm8w3tTOxcc5acEXjC
 lR1DrxhvVgvKs5DL6zFi8bP8CYppWC+xh+nkc614r8+NgOhn2+ebnIe/rvdvJ4J3OQdl/iPiZPqhe
 Qt09oWgd9Qegwk/PbItAWR1UKaZnKY2YqRBVCEKabEHXYZN6wa71uUU+ZKmp2mR39cjHfdKhnq3Xc
 fCKpd5JRQALnvwU2FDuEMXGoVVSZodlujsntrZkgQW5v/TwCiiUOeyCoY2LaDnoDqC3USBtPlO2Xa
 7F8DEqBLOZHZH9BuZ6hsx86YYdkepgy3ZwrOk89CYa3anmSeMbbIxWTZQJOActnLS4nov4rQuGwxe
 R0IvT0lD91H8+r8gsKt7pPb6btJ4/jstGHwfLz9rLrndUM1YX+KwcdLT0NeXT+m+Ev4kXGj7UrbFU
 cQKZhbMBAW74rYnb7UrWJ+hu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oJxzD-008EhX-2Q; Fri, 05 Aug 2022 14:07:35 +0000
Message-ID: <a3837162-00a0-11ec-cf86-b8ab8eb21dba@samba.org>
Date: Fri, 5 Aug 2022 16:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Joseph Sutton <josephsutton@catalyst.net.nz>,
 Matt Grant <matt@mattgrant.net.nz>
References: <CAHA-KoMtF8x6mRHoyXuv4oeXo+1KKbVx=AVwgPO6YHsYvpW-EQ@mail.gmail.com>
 <CAHA-KoME1TZeUmnRks5mQg6nVG3+eUvaJJ5SnE=YUA16YHvVsw@mail.gmail.com>
 <2258887.ElGaqSPkdT@magrathea>
Subject: Re: Hung up on writing Unit tests for dynamic DNS update from
 different source addresses
In-Reply-To: <2258887.ElGaqSPkdT@magrathea>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 05.08.22 um 15:17 schrieb Andreas Schneider via samba-technical:
> On Tuesday, 2 August 2022 23:15:15 CEST Matt Grant wrote:
>> Hi!
>>
>> Figured it out, after a bit of digging.
>>
>> Can't use the test process itself as need to
>> set SOCKET_WRAPPER_DEFAULT_IFACE to say 251 which sets the source IP
>> numbers to 10.53.57.251 and fd00::5357:5fxx.  Or maybe I could try the
>> loopback source address of ::1 for example?
>>
>> Will call nsupdate (needed for testing samba_dnsupdate) via Python
>> subprocess module to do the work.  Bit messy, but there is NO way to add
>> extra IP numbers to the current socket_wrapper interface context that I can
>> see from its man page.
>>
>> Thanks guys!  Will get this done.
> 
> The number of addresses is limited as we need to walk a directory to find an
> IP address.
> 
> from 'man socket_wrapper'
> 
> 
> SOCKET_WRAPPER_DEFAULT_IFACE
>             Additionally, the default interface to be used by an application is
>             defined with "SOCKET_WRAPPER_DEFAULT_IFACE=<ID>" where the valid
>             range for <ID> starts with 1 (the default) and ends with 64. This
>             is analogous to use the IPv4 addresses
>             "127.0.0.<ID>"/"10.53.57.<ID>" or IPv6 addresses
>             "fd00::5357:5f<IDx>" (where <IDx> is a hexadecimal presentation of
>             <ID>). You should always set the default interface. If you listen
>             on INADDR_ANY then it will use the default interface to listen on.

Note that we already have a range allocated for client tests:

selftest/target/Samba.pm:

                 # 11-16 are used by selftest.pl for the client.conf. Most tests only
                 # use the first .11 IP. However, some tests (like winsreplication) rely
                 # on the client having multiple IPs.
                 client            => 11,

I guess we can also use 10.53.57.12 - 10.53.57.16 for dns tests...

metze

