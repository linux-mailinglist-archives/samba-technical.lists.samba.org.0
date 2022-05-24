Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B9532B32
	for <lists+samba-technical@lfdr.de>; Tue, 24 May 2022 15:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iwd8r8sRPiTSJRHRU9poK6CW3kuqmvsJYqubR82TrLc=; b=Wp7Le4h/0f+7EpqouuX/tzgOTg
	fhjuRONnkaxhX5DHHF/qgv9DXOiTAf2Csbnv9wZMjeIQTpCxIikBG2AYRHQHhbBQGhQB9ogaY7ShM
	UlEvj6NaSgbu0BWim7gm+XHPfR+3l3OQm/JJEXvYWm03dMwWalBX3W1R5XpEMZ2KWPWyiPocsSUl0
	26HAn1dJqXLYIdpejWhVaVUGIJEhcifw60uvF40iFuZZkK/s8V43bEeAfvwO0KNqnCypU60KLnnhd
	wy8+6qA7bTEdJ2psKhYMp2546uaK5LbUKc4fCHsc9PX5gIjfthWndtIyf58+SWiLaLg5FHszTiTf9
	Q3llvncA==;
Received: from ip6-localhost ([::1]:22654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ntUW0-002fIG-Ns; Tue, 24 May 2022 13:24:00 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:44539) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ntUVw-002fI6-Ba
 for samba-technical@lists.samba.org; Tue, 24 May 2022 13:23:58 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id DC86440AFC;
 Tue, 24 May 2022 16:23:53 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C341D12D;
 Tue, 24 May 2022 16:23:52 +0300 (MSK)
Message-ID: <c4fc41ee-38a4-eb63-5db5-c217654f6a2c@msgid.tls.msk.ru>
Date: Tue, 24 May 2022 16:23:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: samba-tool domain join segfaults (4.16)
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <ba1a680e-f971-1306-ecd0-4d52520ce7e2@msgid.tls.msk.ru>
 <5f1b93c0-6a44-20e7-01d9-2ed604ad3c88@msgid.tls.msk.ru>
In-Reply-To: <5f1b93c0-6a44-20e7-01d9-2ed604ad3c88@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[Cc'ing David Mulder]

24.05.2022 16:07, Michael Tokarev via samba-technical wrote:
> 24.05.2022 15:52, Michael Tokarev via samba-technical wrote:
>> Hi!
>>
>> I'm facing a segfault in samba-tool when doing domain join, in
>> source3/utils/py_net.c py_net_join_member(). Here it is (with some
>> omissions for brevity):
>>
>> static PyObject *py_net_join_member(py_net_Object *self, PyObject *args, PyObject *kwargs)
>> {
>>          struct libnet_JoinCtx *r = NULL;
>>          uint8_t no_dns_updates;
>> ...
> 
> gdb) p &r
> $1 = (struct libnet_JoinCtx **) 0x7fffffffd7b8
> (gdb) p &no_dns_updates
> $2 = (uint8_t *) 0x7fffffffd7b7 ""
> 
>>          if (!PyArg_ParseTupleAndKeywords(args, kwargs, "|sssssszpp:Join",
>>                                           discard_const_p(char *, kwnames),
>>                                           &r->in.dnshostname,
>>                                           &r->in.upn,
>>                                           &r->in.account_ou,
>>                                           &r->in.os_name,
>>                                           &r->in.os_version,
>>                                           &r->in.os_servicepack,
>>                                           &r->in.machine_password,
>>                                           &r->in.debug,
>>                                           &no_dns_updates)) {
> 
> It looks like when PyArg_ParseTupleAndKeywords() is setting no_dns_updates,
> it does more than single byte, affecting the value of r too. Note the
> addresses of the two - r is right on the next byte after no_dns_updates.

And according to https://docs.python.org/3/c-api/arg.html , 'p' arg
of PyArg_ParseTupleAndKeywords() expects an argument of type int, not
[unsigned] char.

And indeed, this change:

diff --git a/source3/utils/py_net.c b/source3/utils/py_net.c
index 0d774bcb805..c331bf30db4 100644
--- a/source3/utils/py_net.c
+++ b/source3/utils/py_net.c
@@ -71 +71 @@ static PyObject *py_net_join_member(py_net_Object *self, PyObject *args, PyObjec
-       uint8_t no_dns_updates;
+       int no_dns_updates;

fixes the segfault and makes samba-tool domain join work.

But I wonder about in.debug field, - I'm not sure where this
struct is defined..

/mjt

