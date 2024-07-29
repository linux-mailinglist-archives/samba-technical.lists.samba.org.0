Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A771C940104
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2024 00:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1nxxMEagr+NBBC/iBMcLxbswJA9xqh2fIyD6EpC6eiU=; b=lGEytMRnW0ET1D2FXXCK+VoiTK
	bVFPOWa9Ry7sjEloSAASP8zHSw39VnWJ7sOEYW38dOLXMS5pBKVgKEwkd2vjg8SVg9fTgy2cUhv8v
	2jbxBpA4ezLX7dktN4rOfmd1ZaIfWiozasK8wn1Y7dUxLyH3iqnOl9o/G0eclZKFCJYTX9i5AIVSz
	t5UEK4SksjpXaSv0B8rKPcxJrM8DZoVssWoQFbIl/Zdp5yK5EUoF/KycGe3jZYK0hk0VEPnnDOnXr
	bqElInn9S5+tNpkaOTs+Y4zMrtf888SY7NXVdKsAxpGXpqVgkO7zWazTKDlkvRgkbz9AI6hshexO0
	QfjtXKYw==;
Received: from ip6-localhost ([::1]:41170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sYYnH-001lju-4z; Mon, 29 Jul 2024 22:24:39 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:58454) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sYYnB-001ljn-Qp
 for samba-technical@lists.samba.org; Mon, 29 Jul 2024 22:24:37 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 4EBFA3FD42; 
 Tue, 30 Jul 2024 10:08:50 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1722290931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1nxxMEagr+NBBC/iBMcLxbswJA9xqh2fIyD6EpC6eiU=;
 b=na/6U/GqjOo5eZov6l+p7UwAtmUarJO4G6AQzeOUcdUMwWvLErIsXVtS8jvGRDx+cTmcx+
 2nCIefAb4GmazL5vn+8RsBbEixh9tl61GAJ8no7xJl5/eDm5j7817SLSJ4vdSK28NdkUK1
 MjfcA3OeumuHedlMyshj8aGG44PPHIPCw+lfXleqhbp/oA24dsP3tzh09A5Ox3PM8Faafa
 YMHE4iRLwP2IMuVdQ83SRv0ZXgRkM7d66SEpnXggv2a46jVUfNQNKiAMum5iEomb778koc
 rQxEafAe4ZBrrtbRMUFpF8JvooaGJknxy69JBS9/RIg7+tKAi+6VoM4NqBXuCA==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
Content-Type: multipart/mixed; boundary="------------G0ArUkDQDRCWWx56IeyApeOH"
Message-ID: <5157e33d-b1fd-445c-8d60-aeed027cf15d@catalyst.net.nz>
Date: Tue, 30 Jul 2024 10:08:47 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error messages and how they are presented to the common sysadmin
To: miguel medalha <medalist@sapo.pt>, samba-technical@lists.samba.org
References: <024801dae1c5$3f36bdd0$bda43970$@sapo.pt>
Content-Language: en-NZ
In-Reply-To: <024801dae1c5$3f36bdd0$bda43970$@sapo.pt>
X-Spamd-Result: default: False [1.01 / 15.00]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 XM_UA_NO_VERSION(0.01)[];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 FREEMAIL_TO(0.00)[sapo.pt,lists.samba.org];
 FREEMAIL_ENVRCPT(0.00)[sapo.pt]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 HAS_ATTACHMENT(0.00)[]
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

This is a multi-part message in MIME format.
--------------G0ArUkDQDRCWWx56IeyApeOH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/24 02:40, miguel medalha via samba-technical wrote:
> While using 'samba-tool dns', I received the following message:
> 
> ERROR(ldb): uncaught exception - LDAP error 1 LDAP_OPERATIONS_ERROR -
> <00002020: Operation unavailable without authentication> <>
>   File
> "/usr/local/samba/lib64/python3.9/site-packages/samba/netcmd/__init__.py",
> line 285, in _run
>     return self.run(*args, **kwargs)
>   File "/usr/local/samba/lib64/python3.9/site-packages/samba/netcmd/dns.py",
> line 1375, in run
>     remove_dc.remove_dns_references(samdb, logger, dnshostname,
>   File "/usr/local/samba/lib64/python3.9/site-packages/samba/remove_dc.py",
> line 101, in remove_dns_references
>     zones = samdb.search(base="", scope=ldb.SCOPE_SUBTREE,
> 
> This message contains a lot of information that is useful only to coders.
> The common systems administrator will embark on too long a journey through
> all that haystack in search of the needle he desperately needs:
> 
> ERROR : Operation unavailable without authentication

Thanks. We are working through these haphazardly.

The aim is to present known errors clearly and succinctly but not hide the
traceback when a genuinely unexpected thing happens. We never want the
short message to lie. It gets harder as we progress.

If you open bugs on https://bugzilla.samba.org we will not loose track.

The attached patch is probably right for this one.

Douglas

--------------G0ArUkDQDRCWWx56IeyApeOH
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-samba-tool-no-traceback-for-unauthenticated-rootdse-.patch"
Content-Disposition: attachment;
 filename*0="0001-samba-tool-no-traceback-for-unauthenticated-rootdse-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAxNzQzZjllYWU3ODEyZTM3NmIxMTM0NmMzZmU2MTliNWQ5NjYzNGIwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEb3VnbGFzIEJhZ25hbGwgPGRvdWdsYXMuYmFnbmFs
bEBjYXRhbHlzdC5uZXQubno+CkRhdGU6IFR1ZSwgMzAgSnVsIDIwMjQgMDk6NTM6MTQgKzEy
MDAKU3ViamVjdDogW1BBVENIXSBzYW1iYS10b29sOiBubyB0cmFjZWJhY2sgZm9yIHVuYXV0
aGVudGljYXRlZCByb290ZHNlIGFjY2VzcwoKVW5kZXIgc29tZSBjaXJjdW1zdGFuY2VzIHJv
b3Rkc2UgcmV0dXJucyBhbiBvcGVyYXRpb25zIGVycm9yIHdpdGgKIk9wZXJhdGlvbiB1bmF2
YWlsYWJsZSB3aXRob3V0IGF1dGhlbnRpY2F0aW9uIiBpbnN0ZWFkIG9mIGluc3VmZmljaWVu
dAphY2Nlc3MgcmlnaHRzLgoKU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBCYWduYWxsIDxkb3Vn
bGFzLmJhZ25hbGxAY2F0YWx5c3QubmV0Lm56PgotLS0KIHB5dGhvbi9zYW1iYS9uZXRjbWQv
X19pbml0X18ucHkgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3B5dGhvbi9zYW1iYS9uZXRjbWQvX19pbml0X18ucHkgYi9weXRob24v
c2FtYmEvbmV0Y21kL19faW5pdF9fLnB5CmluZGV4IDdkNzQzNTI2MjA3Li40YzZmYmEwNzU1
MCAxMDA2NDQKLS0tIGEvcHl0aG9uL3NhbWJhL25ldGNtZC9fX2luaXRfXy5weQorKysgYi9w
eXRob24vc2FtYmEvbmV0Y21kL19faW5pdF9fLnB5CkBAIC0yNDUsNiArMjQ1LDkgQEAgY2xh
c3MgQ29tbWFuZChvYmplY3QpOgogICAgICAgICAgICAgZWxpZiBsZGJfZWNvZGUgPT0gRVJS
X0lOU1VGRklDSUVOVF9BQ0NFU1NfUklHSFRTOgogICAgICAgICAgICAgICAgIHNlbGYuX3By
aW50X2Vycm9yKCJVc2VyIGhhcyBpbnN1ZmZpY2llbnQgYWNjZXNzIHJpZ2h0cyIpCiAgICAg
ICAgICAgICAgICAgZm9yY2VfdHJhY2ViYWNrID0gRmFsc2UKKyAgICAgICAgICAgIGVsaWYg
bGRiX2Vtc2cgPT0gIk9wZXJhdGlvbiB1bmF2YWlsYWJsZSB3aXRob3V0IGF1dGhlbnRpY2F0
aW9uIjoKKyAgICAgICAgICAgICAgICBzZWxmLl9wcmludF9lcnJvcihsZGJfZW1zZykKKyAg
ICAgICAgICAgICAgICBmb3JjZV90cmFjZWJhY2sgPSBGYWxzZQogICAgICAgICAgICAgZWxz
ZToKICAgICAgICAgICAgICAgICBzZWxmLl9wcmludF9lcnJvcihtZXNzYWdlLCBsZGJfZW1z
ZywgJ2xkYicpCiAKLS0gCjIuMzQuMQoK

--------------G0ArUkDQDRCWWx56IeyApeOH--

