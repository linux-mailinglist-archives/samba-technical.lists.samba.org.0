Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E93D29604C
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 15:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=r6e8MnaTytLVA/jxPZuSiqulee8ToBIcuO9MoGXJWN8=; b=3FacDxVGph0UuMLcBjVx6NO0CI
	N/4Sm2C5aj7EFVuU4DIEqKa1Bwx97eEXS6K17wf90wUJzOcc8eQ/sVW/NCaZLFb9JPXGVDlqld8fe
	GYmtJ8sVao8wC7AT3LOejEkhbckIWZ+dyLUVEQz97rul6UHFKsb+cbC/D7ea+gAUCxkSly7AGJAbH
	DSJFWYcfw3Duj18bOv3CsLd+DXPgBJ0RZxpMvzTzxQCxYbc7tLgR5Lc26FDCKk+MDUkzGcEJZy933
	EjlLhBbsYb/3/6rp+vU3SDobbMqkdRJAaeBWetwKrLegNMItcr1UvMahWG9wVl7h6CH++PhyH4Qi1
	Ka5nAxxw==;
Received: from ip6-localhost ([::1]:55112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVaxW-00DHwf-QE; Thu, 22 Oct 2020 13:48:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14320) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVaxR-00DHwY-EA
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 13:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=r6e8MnaTytLVA/jxPZuSiqulee8ToBIcuO9MoGXJWN8=; b=v/KP9tjhWVuN+wD9rdfF4IFdB5
 LtakovHG5yGLgSWu7kp35CAULiQkZNroy6329McSo5OD8WYTnAC3ALTowG/hFRWMq67gBIFshXpIN
 DBlcqkDp7yryQ9f2BCxZlsoHZe4uTvoxt5ajQKuB93lQIn93py+2F9i3DCm8Cvc76Pg5SqXmrIS5J
 AgpBq/uUt+MakN+Tp929yOh20894UEfXWWiisW4DwnMAcZo1gFohNXKkfeq+VeQ0O5XvzgEmRiOss
 Y1QALpdlviUFaJuPkNGKBxjF6Zvf5qRkBMp9eLf2sZ6YoIp/w/ulKcyagE2pZLmep9dG3Q1RNyPLV
 rNZT6KazB0Cs28t8isEGHRSTuwtVPLC2Tc5vBu0IpKOQcRHDe3Ga6q6AZQUag/7bNiyQJ0j9fntz2
 +WlQWZkT/mWfG4Al8UtjUpzmYBbrTCTrmWxrB4BbnEAIfHp5owuoDtYEMXSRUoC1TyX6GiIpPGAFh
 17DZkX4ER8ejcaBY6pbDcO2m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVaxQ-0002el-9H
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 13:48:44 +0000
Subject: Re: 4.12 -> 4.13 upgrade
To: samba-technical@lists.samba.org
References: <vmime.5f915a06.1483.6a1ed22ad77c366@ms249-lin-003.rotterdam.bazuin.nl>
 <vmime.5f918bed.198e.754e857b761d4e3d@ms249-lin-003.rotterdam.bazuin.nl>
Message-ID: <59d3c9e3-ada0-248a-8db2-ac45dba7fda6@samba.org>
Date: Thu, 22 Oct 2020 14:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <vmime.5f918bed.198e.754e857b761d4e3d@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 22/10/2020 14:41, L.P.H. van Belle via samba-technical wrote:

>> OK, you are running buster but you must be running python3-dnspython
>> version 2.0.0 because that error message is coming from that
>> version, it has nothing to do with Samba:
>>
>>       def query(self, qname, rdtype=dns.rdatatype.A,
>> rdclass=dns.rdataclass.IN,
>>                 tcp=False, source=None, raise_on_no_answer=True,
>> source_port=0,
>>                 lifetime=None):  # pragma: no cover
>>           """Query nameservers to find the answer to the question.
>>
>>           This method calls resolve() with ``search=True``, and is
>>           provided for backwards compatbility with prior versions of
>>           dnspython.  See the documentation for the resolve()
>> method for
>>           further details.
>>           """
>>           warnings.warn('please use
>> dns.resolver.Resolver.resolve() instead',
>>                         DeprecationWarning, stacklevel=2)
>>           return self.resolve(qname, rdtype, rdclass, tcp, source,
>>                               raise_on_no_answer, source_port,
>> lifetime,
>>                               True)
>>
>> Version 1.16.0 (which Buster should be using) does not have the
>> 'DeprecationWarning'.
> I do agree with you but..
> Well,  im 100% sure its 1.16 thats installed.
>
> dpkg -l |grep python3-dnspython
> ii  python3-dnspython              1.16.0-1                      all          DNS toolkit for Python 3
>
This is the same code from 1.16.0:

def query(qname, rdtype=dns.rdatatype.A, rdclass=dns.rdataclass.IN,
           tcp=False, source=None, raise_on_no_answer=True,
           source_port=0, lifetime=None):
     """Query nameservers to find the answer to the question.

     This is a convenience function that uses the default resolver
     object to make the query.

     See ``dns.resolver.Resolver.query`` for more information on the
     parameters.
     """

     return get_default_resolver().query(qname, rdtype, rdclass, tcp, 
source,
                                         raise_on_no_answer, source_port,
                                         lifetime)

I would suggest that to get the warning that you are getting, you must 
be running either python3-dnspython 2.0.0 or a 'mangled' version 1.16.0

Rowland



