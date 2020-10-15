Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E910828F9E6
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 22:07:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HZIUA7E7gi/4v3VMeCutsuaLw9yjJCMpxdHfrNwEx+U=; b=1SIk8N+SWnAwaRW1VtyloczTef
	GxroMFVMvmY/1GpFZwOtfY1P59LcfyceXxoBtGHkYocA6Cc7e+mifxgt3NDt4cwaZmkNy8f8kNYvv
	LsG01ufByQTk0laYyEDg0sISgVYjdDMCSwVWK5em5yXG53MjhfFm5ncz+hkOQ3KkFtTQoF4Kc1IGF
	AWs/b+X8/rjWTFgpxuA3TIwKKwCVwW8bH6f5ej1ceF/35z2iJeFWObShNhME96yHBtkg3Ul5PCx5W
	VCLE/t7I7ACCoDDn8Sf0zKXCVCtkdVYvojeDJSk/zF/7KMGESUhKt/A3cSNuEqZzRiKINqUpovCsz
	UjYXMXXQ==;
Received: from ip6-localhost ([::1]:19198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT9XC-00CKEo-5j; Thu, 15 Oct 2020 20:07:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62928) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9X6-00CKEg-9S
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 20:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=HZIUA7E7gi/4v3VMeCutsuaLw9yjJCMpxdHfrNwEx+U=; b=VClSOUDHkGy8oTb+YqMY7NK3Hz
 xF4w3rvH9kEmk0V5zSQvX1JPIKuUfs6+3J9mEZ1U/yUQIahhHnv8LiUJSGLOOZyKN3ogZjJz4o/z8
 IXk+TlYcRrcgjU5yNfzZVUpIze+bewmNqoRkxiHTPrMQHmogklZYYqGybP/9bCWucA5hn5hgqLkhL
 PbrhBwHKSvK6bI3Zg/xExCNDUkyxSRBLmVjWyuUWcFlEsyP5uVVwGxkdHuoRB8A1r40gaYtlKAqtJ
 j1lVo61IYTluK4ikH2A+vwd2Rcux5NqnI7rD4M+hSEIpBp32ADSTdZBXXCoMnK5sC7+ohn0fHECk5
 ehs7urgf/1FzCXyFq3M+88NYiPZgpl7GZ6+kSphkR5FFfUUB4syCzS8nd3mQmfdaYrm0gTVrS+fCo
 AUNHHNkgtEeoqElc5ujjXSyhGaZNOUdPbG4oykbcsDVvkPjgUk+uokuw9ATV/kX83fqWvC0OwE3fn
 QXZgY4FpY+R95O3aZbqh3+JR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9X5-000449-Gy
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 20:07:27 +0000
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
To: samba-technical@lists.samba.org
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <20201015192330.GI3840862@jeremy-acer>
 <09b466404b11983f992ac2f89c369b33d3a1a135.camel@samba.org>
 <20201015193751.GJ3840862@jeremy-acer>
 <d6681d5c508524dd97b093f332e8cea818cf1a3c.camel@samba.org>
 <20201015195534.GM3840862@jeremy-acer>
Message-ID: <96555a46-20a8-48ba-652a-5bbbaad67f80@samba.org>
Date: Thu, 15 Oct 2020 21:07:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015195534.GM3840862@jeremy-acer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/10/2020 20:55, Jeremy Allison via samba-technical wrote:
> On Thu, Oct 15, 2020 at 03:45:22PM -0400, Simo Sorce via samba-technical wrote:
>>> Personally I think we should just add the CC-By-SA
>>> attribution and be done with it.
>> I'll let you argue with our counsel on that :-)
> Fair enough - we should always do "What The Lawyers Say" (tm) :-).
>
> I don't want to change the text though, just the name
> if we have to.
>
> How about:
>
> Samba Developer's Declaration of Origin
>
> "Declaration of Origin" is IMHO more descriptive
> of what the person is doing, as they're just
> providing a declaration here.
>
> Thoughts ?
>
If we must change, then that is as good as anything, but how about 
dropping 'of Origin' from the end ? This will stop Simo from wondering 
about *I* ;-) and it says what it is, A developers declaration.

Rowland



