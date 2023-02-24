Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 304876A1DB5
	for <lists+samba-technical@lfdr.de>; Fri, 24 Feb 2023 15:47:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+edjete77EZrarCdSo3xbSdJJidkqM3xqIsuaL5GML0=; b=H5tOUO6Rk2x/wjJ1PAjeUcofsp
	AFG18tIGFbn97KhHALYIr4B9rheA7watjjglSUt8cdM2M0sWWP81ZSklPtA74utnK1irgDkSxLnlU
	I7yvdsSjMx29aH2hgEPORzBSDMJ2HifU/N4bRbZGRfEychGdQIaA2bBve/D+G5A6aoZPapCyUh/9V
	5hy6fEvQwxHh/z5+FKrfNwKoL2aF73+V+DxpgTX8n32G3iV6V7Hp/CM1MBHpJPHO/rDf9X+N1RL/7
	w4gKjDoNYn84czCp2Ff5B78GOGdtLZdUP15kjoQBwpHX7lew6eaeKV0GOZbdYC53OdAdG4ldNFosM
	+013ww8Q==;
Received: from ip6-localhost ([::1]:38934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pVZL0-00Dwqw-J5; Fri, 24 Feb 2023 14:46:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27070) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pVZKv-00Dwqn-Cn
 for samba-technical@lists.samba.org; Fri, 24 Feb 2023 14:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:From:To:Date:Message-ID;
 bh=+edjete77EZrarCdSo3xbSdJJidkqM3xqIsuaL5GML0=; b=ifSEz/h1G06jeqnlmilvvMiFF3
 gyjJ+DeVxSXd38ItC2ovr/Ahb7VgDNBOSAhpAqnsg0tC7iYVk/F8YqOR0X8ikLk7w0aO8kmOgejDB
 xwMrecsOBI99iYzztaQqojX+o7IKeFF6XbfTXVsHnhfMaYGw+FOfXXYxEAE9dlPyrS+BhcFU2qJID
 ZBOS8mddLUw5fGFXKdeslpeQ6BMPHJcjAvmeffBv+VHw59hhquzk/k0KSiN6b99Rvy9lLEjdEXu3J
 qwmClpOTdqN3LLYylXD2igju1r0TJLU4W5MxOLhRWwVbEuy2FOrzGuJ7YBXnxa81QnCvx9+YziK9e
 EI/lNSHJOoJ3Sy1O92BE23MFiuB59gXqoU0vnCSYXLi2hLCU6BpWMeRVt8SKGn3Do3b+eCtL1jNVu
 JZMNLOEtdLO/s6LTNvAxZFxe8gqPQIRPOOHX5JLvaFUi+GZtsA9b2TOIJKvb5ydIGsASOVJEvmr5z
 rlH1a5/gthfrctkB7eYbJMzs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pVZKt-00GB74-U3; Fri, 24 Feb 2023 14:46:11 +0000
Content-Type: multipart/mixed; boundary="------------nbwadoSQOZjyPYAszxtBRM1A"
Message-ID: <1a67acae-62b7-f1be-a23f-d5acbc838fc0@samba.org>
Date: Fri, 24 Feb 2023 15:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US, de-DE
To: Jule Anger <janger@samba.org>
Subject: WHATSNEW: SMB Server performance improvements
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------nbwadoSQOZjyPYAszxtBRM1A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jule,

I think we want this in the 4.18 release notes...

Thanks!
metze
--------------nbwadoSQOZjyPYAszxtBRM1A
Content-Type: text/plain; charset=UTF-8; name="bfixes-tmp418.txt"
Content-Disposition: attachment; filename="bfixes-tmp418.txt"
Content-Transfer-Encoding: base64

RnJvbSA3YmZjMmQ3NDc5OTNiMzg3OThhMzZhNmUzNmFjYjgzYTBmN2U4MjY0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEu
b3JnPgpEYXRlOiBGcmksIDI0IEZlYiAyMDIzIDE1OjM5OjM1ICswMTAwClN1YmplY3Q6IFtQ
QVRDSF0gV0hBVFNORVc6IFNNQiBTZXJ2ZXIgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzCgpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEub3JnPgotLS0K
IFdIQVRTTkVXLnR4dCB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvV0hBVFNORVcudHh0IGIvV0hBVFNORVcudHh0
CmluZGV4IGEwMzVkYWVlZjc5OS4uOGYyOGM4NjRmYjBhIDEwMDY0NAotLS0gYS9XSEFUU05F
Vy50eHQKKysrIGIvV0hBVFNORVcudHh0CkBAIC0xNiw2ICsxNiwxOSBAQCBVUEdSQURJTkcK
IE5FVyBGRUFUVVJFUy9DSEFOR0VTCiA9PT09PT09PT09PT09PT09PT09PQogCitTTUIgU2Vy
dmVyIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50cworLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKworVGhlIHNlY3VyaXR5IGltcHJvdmVtZW50cyBpbiByZWNlbnQgcmVs
ZWFzZXMKKyg0LjEzLCA0LjE0LCA0LjE1LCA0LjE2KSwgbWFpbmx5IGFzIHByb3RlY3Rpb24g
YWdhaW5zdCBzeW1saW5rIHJhY2VzLAorY2F1c2VkIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb25z
IGZvciBtZXRhIGRhdGEgaGVhdnkgd29ya2xvYWRzLgorCitXaGlsZSA0LjE3IGFscmVhZHkg
aW1wcm92ZWQgdGhlIHNpdHVhdGlvbiBxdWl0ZSBhIGxvdCwKK3dpdGggNC4xOCB0aGUgbG9j
a2luZyBvdmVyaGVhZCBmb3IgY29udGVuZGVkIHBhdGggYmFzZWQgb3BlcmF0aW9ucworaXMg
cmVkdWNlZCBieSBhbiBhZGRpdGlvbmFsIGZhY3RvciBvZiB+IDMgY29tcGFyZWQgdG8gNC4x
Ny4KK0l0IG1lYW5zIHRoZSB0aHJvdWdocHV0IG9mIG9wZW4vY2xvc2UKK29wZXJhdGlvbnMg
cmVhY2hlZCB0aGUgbGV2ZWwgb2YgNC4xMiBhZ2Fpbi4KKwogTW9yZSBzdWNjaW5jdCBzYW1i
YS10b29sIGVycm9yIG1lc3NhZ2VzCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIAotLSAKMi4zNC4xCgo=

--------------nbwadoSQOZjyPYAszxtBRM1A--

