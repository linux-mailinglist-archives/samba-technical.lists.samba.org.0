Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A81B3C238
	for <lists+samba-technical@lfdr.de>; Fri, 29 Aug 2025 20:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NcPQlIy5RLt8gpltJUR964uaQycyIlyScg8LlCNvIso=; b=SVZuWVDM+FVlFG3MUj9haW0NfV
	RFvz08/ssNRYyTZvWByzp5r3Ro03N7VBTkyQUw1rSxbDIDAAuen1zSdwn0XvGqjiCNreONJRsvnEu
	Vp6Em4nbR9E1386LOxWxlDcMQaIgCPwdN/3nAEgyv1TkQIqQWpH0Nl0RnTxsQqJjeGbdbvtkU0lFR
	1HULQ96xd09cf/uvDURI6Uhv2WLb7oPz5WiB2v6jzpV3u+k8/LNTXSu+i3Av90VoyBAzo766BSz1Q
	83i1BN4ihPjO3+HEtR7qSW0tuLTjSh+7Opxac3DpHlvqJll5Ey2iMoanJA5LlJqB1LgyO1Qzwa4t6
	uS6sITZA==;
Received: from ip6-localhost ([::1]:62968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1us3SF-000mUQ-EF; Fri, 29 Aug 2025 18:04:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49556) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1us3SB-000mUJ-45
 for samba-technical@lists.samba.org; Fri, 29 Aug 2025 18:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=NcPQlIy5RLt8gpltJUR964uaQycyIlyScg8LlCNvIso=; b=PaITX8LrYogS9eQ0cPDE+1A9BO
 5J+GCV9D+EtdBlBgL82oKoqNI/c1oKbRR8eo5GpI8maZfwZy4K/QiQJeFv/o7Wu8rFj92hXfik82m
 eMFooAK+wooe0Cg56a6kqAGK4iJRKuOsZkL3LHgqbeuZY0jvdTxmqYNDl12G6h0Zi+9vTkrbUwqli
 aZaogIWSlYUtyrCpfAjY2bEw8SWAa+UpeMiPyHQhIdCVMR4YyjClfzQTLPdetBg6brIte3FQ3TLSJ
 C44kFzQkO1okhj8v7luYsn2S1i+Fy+18kXbNnvEJSbfEgIQ4ALCGTsnpTh5UpmXWM9vcf9m5FfOPw
 NHyvO2CyIBP+B8Ya18bJG53pR1mNAkwSe869F3Z8bnSHLgfmhYhgJtP+hdbbhRdtCkvBIYIgfvlwL
 LCw0r5C6yK1pL7obzAz3IQwDh68WzA9UYx79aUDBox1rFvNtvCo0KSYAnG90n4usWJlSSlmTk4Dh1
 OKyzAomBhbHnlnCZYwVxwigT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1us3SA-001TJm-07; Fri, 29 Aug 2025 18:03:58 +0000
Message-ID: <2854f742-a0bc-4456-a372-9fa2d4e2ee3f@samba.org>
Date: Fri, 29 Aug 2025 20:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cifs:for-next-next 28/146] fs/smb/client/smbdirect.c:1856:25:
 warning: stack frame size (1272) exceeds limit (1024) in
 'smbd_get_connection'
To: Steve French <smfrench@gmail.com>
References: <202508291432.M5gWPqJX-lkp@intel.com>
 <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
 <CAH2r5mvksbiH-D4FbVb0PVg1vnik+WU7d0kxRUk0S9h9S+=zvw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5mvksbiH-D4FbVb0PVg1vnik+WU7d0kxRUk0S9h9S+=zvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
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
Cc: linux-cifs@vger.kernel.org, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, samba-technical@lists.samba.org,
 oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

QW0gMjkuMDguMjUgdW0gMTk6NTkgc2NocmllYiBTdGV2ZSBGcmVuY2g6DQo+IEkgaGF2ZSB1
cGRhdGVkIHRoZSBwYXRjaCAoc2VlIGF0dGFjaGVkKSwgYW5kIHVwZGF0ZWQgY2lmcy0yLjYu
Z2l0IGZvci1uZXh0LW5leHQNCj4gDQo+PiBJJ20gbm90IHN1cmUgaWYgdGhlIGZvbGxvd2lu
ZyBzaG91bGQgYmUgYWRkZWQNCj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4NCj4gDQo+IFRoYXQgaXMgYSBnb29kIHF1ZXN0aW9uLCBidXQgSSBs
ZWFuIGFnYWluc3QgaXQgc2luY2UgdGhlICJpbml0aWFsIGJ1ZyINCj4gd2FzIG5vdCByZXBv
cnRlZCBieSB0aGVtIHRoYXQgY2F1c2VkIHRoZSBwYXRjaC4gIElmIGl0IHdhcyBhIGRpc3Rp
bmN0DQo+IHBhdGNoIGZpeGluZyB0aGUgYnVnIHRoZXkgcG9pbnRlZCBvdXQsIHRoZW4geWVz
IGl0IHNob3VsZCBiZSBhZGRlZCwNCj4gYnV0IGNvdWxkIGJlIGNvbmZ1c2luZyBpZiB3aGF0
IHRoZXkgcG9pbnRlZCBvdXQgd2FzIHRvdGFsbHkgdW5yZWxhdGVkDQo+IHRvIHRoZSBwdXJw
b3NlIG9mIHRoZSBwYXRjaC4NCg0KWW91IHNxdWFzaGVkIGl0IGludG8gdGhlIHdyb25nIGNv
bW1pdC4gUGxlYXNlIHBhdGNoIHRoaXMgb25lOg0KZjJlMjc2OTI3NWY0YWE2ZTRkNWZhOTgw
MDQzMDFlOTEyODJhMDk0YSBzbWI6IHNtYmRpcmVjdDogaW50cm9kdWNlIHNtYmRpcmVjdF9z
b2NrZXRfaW5pdCgpDQoNClRoYW5rcyENCm1ldHplDQo=

