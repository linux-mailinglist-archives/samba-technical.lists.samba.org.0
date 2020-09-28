Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D749827AA8C
	for <lists+samba-technical@lfdr.de>; Mon, 28 Sep 2020 11:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SmnesWkqTcZ0YJ2afEfS/NHTMN66xCn1tJd6jEiRrnY=; b=jDRH5uTUijhHpnVIHL5R3afUi9
	UnHDQA/EobPk7G7R4HDw4oSsiYRVg72MJlAldYNGViqkUmeP8mJuvA1qMckw3h3f7UeLKr9RgpbU5
	lgff/8SCsLJlrT+QJaoFJwt9aJqRIwrPMUaC/uM928HsZPElunKlzM3Kwc2E4ALnWsumMKCdZJcsb
	7et9DgGNLrSVAkXHMwNF3py8GSIm4/6WQhkbfmh2YU/lqb7DZoQgQkOuQ83CICBVh1M5u2fcivjiD
	rqFOPRb48phc/A8mk7haaR2VU167aLs8Q2oER8p3OBSEtiK2iwZx0K5/5WUd6rHJtPkI44NytEq8M
	fRZ8CN0A==;
Received: from ip6-localhost ([::1]:65214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kMpK9-007fU1-HS; Mon, 28 Sep 2020 09:19:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44074) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMpK5-007fTu-6s
 for samba-technical@lists.samba.org; Mon, 28 Sep 2020 09:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=SmnesWkqTcZ0YJ2afEfS/NHTMN66xCn1tJd6jEiRrnY=; b=xeH55JNbqCXDG8bCH05kCYw0CO
 BSZTXcy7s/GRu0l06duUioQan+3OK9L/pCNvrbbrucjGJ6/Bd9qz8bcUFYfu4m1X9rjXfMgPjZQXV
 71s+fBbpQ68RLBTrhyuO+8aDiSanZuNwxcdn3UwQ6xuTwmyvzIACA4PbkvH6dCy15SNCXDYXGyioq
 BEMprB/JXlSEgzz7efu0mh8L4SIMKblJ4A87n7PodWeCr9nPJhf28JAvM5UVuHdj3GHBdbRg74GzF
 VQq7zktunvlo0pm0lf5d+phKoV7OPQ4qL8QebgRP3nYVL3+KOKmUQIcQs410KVJX4vXLdwDM1C901
 9UuGDs20Q7GTfVtb4hfaz0GRgQsOvhcEeDgAhRHMVybcpdeRXmNbD8vAXsUX20cql5IX1/wneYVG1
 Aga9daMo7Y4tx59QQPiKVwor/pT4f8c4wzSWX9XQwqfNmNhuKwZM6ORNxwx8J1F6X0jVA/uwLh5A8
 JoyMfBNuvy5mV8mwgXu9VkZP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMpK4-0004XD-Ns
 for samba-technical@lists.samba.org; Mon, 28 Sep 2020 09:19:52 +0000
Subject: Re: winbindd callbacks not triggered
References: <CAC-fF8S+4hyY+dsWLFPcfxjR0thU64SrCGX8u8n_3YEi-0RwVA@mail.gmail.com>
 <58ea03e2-f2ff-12b3-7369-aaa2288bf415@samba.org>
 <CAC-fF8TXoZvoEvrEtSNVhZpOF+JBW4tqu8hEm810KrSr1p9FUQ@mail.gmail.com>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <77a2155b-9c53-f661-d76a-00be8a63b8ba@samba.org>
Date: Mon, 28 Sep 2020 10:19:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8TXoZvoEvrEtSNVhZpOF+JBW4tqu8hEm810KrSr1p9FUQ@mail.gmail.com>
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

On 28/09/2020 10:16, Isaac Boukris wrote:
> On Mon, Sep 28, 2020 at 11:12 AM Rowland penny via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>> Thoughts?
>>>
>> Sounds to me like a misconfiguration in /etc/nsswitch.conf, running 'id
>> root' should check /etc/passwd and /etc/group first. winbind shouldn't
>> even be consulted.
> Could be, but some of the failed requests are for domain users and groups.

Need more info, how is Samba being run, what is in smb.conf ? what 
domain users and groups are failing ?

Rowland



