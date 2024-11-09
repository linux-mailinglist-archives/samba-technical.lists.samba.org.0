Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B799C2FA4
	for <lists+samba-technical@lfdr.de>; Sat,  9 Nov 2024 22:35:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aHyDWy6BM/0mMd0bskq3cDq/6k+Q4KirgArd3/dUE8k=; b=gTeCm0asQYWeIetbDZXFC9MCdX
	gkjnGZmles8RIv0wOssCgNcWgr27zmJ7cZkcO6ArL+mJ0nURPnkQn5gy35/V6OdiS7IYce3fsFUPA
	14mzoXYo0G1mPMN53teQrberAt4qRfZSaiRhQIz0kRDCc8bJJHUOgm9T2jrrXxlCmUtYpMqxLNPQS
	DJdHwcQlJrdGeCvkHri0bZ40Qxx2SQ+/QtxziQ1rmssh5btOiQ8rrFOB2KItlAjZZvDnMdsqXadyf
	DG1ueRXX051JkPFZz6vuza+E52yqBCW4+DZ1+IX5pLaT97lGzTxJ9J6hBhye34A9B+VG/LZAUhLl/
	mH/uBDOQ==;
Received: from ip6-localhost ([::1]:25420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t9t6W-008CFS-Kn; Sat, 09 Nov 2024 21:34:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31330) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9t6R-008CFL-Ui
 for samba-technical@lists.samba.org; Sat, 09 Nov 2024 21:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=aHyDWy6BM/0mMd0bskq3cDq/6k+Q4KirgArd3/dUE8k=; b=Wwo8uuX8QaqnR4bKkImdXEDMGB
 Pxu0033lnTh6rRiB8l4Tz/VV3IkboW5Mc/VfTo8pGHMGE6welxHds2RNadVjt3Z8xRyM0eK1Sr72A
 6qEk23sqLbmM4pbHcfrEjFOC2nIYQcA7wI7n5I06XvUzjsHakr0WzIxL7rFKtg+ynxCAGfPY0kyrW
 oFdVUfEASmc89m4s7UX3IHJIGcS6fvNeqEwrR6UlZOxcPEUj6kdrLyJlGxLnlFpirAubifIit+ZiT
 wt71GHd6STn8SYC9T60oOIPzqLihaKc2aY/sGurngQS3cgxMBcvxSmJnspDIUMtV74gnOVvoNG0ta
 lPOSyhISaQvDPW1bXaPJ7yr5xnz3DV7wOz/E6LGYVoyVamnqddP4uVJxoSgg094wXwYWQ9smJUoQJ
 ocv9qDAe1laHMcH9MZHVM9uh66deLrEIDbReweobq2Esif5hsBJMSE6opi9M8umydsq4qE51QotUQ
 2FXK7/YLNIpJcJwPBBN97yog;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9t6P-009oLw-2z; Sat, 09 Nov 2024 21:34:42 +0000
Message-ID: <7932bad1-8bc5-48e7-9561-60029d5a6056@samba.org>
Date: Sat, 9 Nov 2024 22:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: samba-technical <samba-technical@lists.samba.org>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kxJsDW9MTKz3uyXAfD8rm7c9"
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
Cc: vl@samba.org, Steve French <smfrench@gmail.com>,
 Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kxJsDW9MTKz3uyXAfD8rm7c9
Content-Type: multipart/mixed; boundary="------------0ZlhA8gIZUHnPeOYNX08q0qJ";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Cc: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 Jeremy Allison <jra@samba.org>, vl@samba.org,
 Stefan Metzmacher <metze@samba.org>
Message-ID: <7932bad1-8bc5-48e7-9561-60029d5a6056@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
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
In-Reply-To: <c146a052-40e2-4d90-9a8e-9236a0b2dc20@samba.org>
Autocrypt-Gossip: addr=jra@samba.org; keydata=
 xsDiBDxEcLsRBADMQzpWoVuu4oiq23q5AfZDbakENMP/8ZU+AnzqzGr70lIEJb2jfcudViUT
 97+RmXptlnDmE4/ILOf6w0udMlQ9Jpm+iqxbr35D/6qvFgrgE+PnNAPlKSlI2fyGuLhpv1QP
 forHV13gB3B6S/ZWHpf/owKnJMwu8ozQpjnMnqOiVwCg8QnSX2AFCMd3HLQsqVaMdlO+jBEE
 AKrMu2Pavmyc/eoNfrjgeRoNRkwHCINWO5u93o92dngWK/hN1QOOCQfAzqZ1JwS5Q+E2gGug
 4OVaZI1vZGsAzb06TSnS4fmrOfwHqltSDsCHhwd+pyWkIvi96Swx00e1NEwNExEBo5NrGunf
 fONGlfRc+WhMLIk0u2e2V14R+ebDA/42T+cQZtUR6EdBReHVpmckQXXcE8cIqsu6UpZCsdEP
 N6YjxQKgTKWQWoxE2k4lYl9KsDK1BaF6rLNz/yt2RAVb1qZVaOqpITZWwzykzH60dMaX/G1S
 GWuN28by9ghI2LIsxcXHiDhG2CZxyfogBDDXoTPXlVMdk55IwAJny8Wj4s0eSmVyZW15IEFs
 bGlzb24gPGpyYUBzYW1iYS5vcmc+wlcEExECABcFAjxEcLsFCwcKAwQDFQMCAxYCAQIXgAAK
 CRCl3XhJ1sA2rDHZAKDwxfxpGuCOAuDHaN3ULDrIzKw9DQCdHb3Sq5WKfeqeaY2ZKXT3AmXl
 Fq7OwE0EPERwvhAEAIY1K5TICtxmFOeoRMW39jtF8DNSXl/se6HBe3Wy5Cz43lMZ6NvjDATa
 1w3JlkmjUyIDP29ApqmMu78Tv4UUxAh1PhyTttX1/aorTlIdVYFjey/yW4mSDXUBhPvMpq52
 TncLRmK9HC6mIxJqS0vi6W9IqGOqDRZph3GzVzJN7WvLAAMGA/sGAyg2rVsBzs77WH0jPO+A
 QZDj+Hf/RFHOwmcyG7/XgmV6LOcQP4HfQHH3DGYihu5cZj3BeWKPDJnjOjB2qmr+FTjYEsjw
 LDBNG7rjRye412rUbNwmEtcD2/dw4xNyu5h2u+1++KVBPf4SqG/a10gDqGJXDHA1Os5MmnQl
 3CTq9sJGBBgRAgAGBQI8RHC+AAoJEKXdeEnWwDasbeIAoL6+EsZKAYrZ2w22A6V67tRNGOIe
 AJ0cV9+pk/vqEgbv8ipKU4iniZclhg==

--------------0ZlhA8gIZUHnPeOYNX08q0qJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvOS8yNCA0OjI2IFBNLCBSYWxwaCBCb2VobWUgdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gT24gMTAvOS8yNCA5OjQzIFBNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4+
IENhbiB3ZSBqdXN0IG1hcCAoYWNjZXNzX21hc2sgKEZJTEVfQVBQRU5EX0RBVEF8U1lOQ0hS
T05JWkUpKSA9PSANCj4+IChGSUxFX0FQUEVORF9EQVRBfFNZTkNIUk9OSVpFKSkNCj4+IHRv
IE9fQVBQRU5ELCByZWdhcmRsZXNzIG9mIFBPU0lYIG1vZGUgPw0KPiANCj4gdGhpbmtpbmcg
YWJvdXQgdGhpcyBhIGJpdCBtb3JlLCB0aGlzIHNlZW1zIGRvYWJsZSwgYWxiZWl0IG9ubHkg
Zm9yIFBPU0lYIA0KPiBtb2RlLiBGb3Igbm9uLVBPU0lYIG1vZGUgd2UgY291bGQgcG90ZW50
aWFsbHkgYnJlYWsgV0luZG93cyBhcHBsaWNhdGlvbiANCj4gdGhhdCBvcGVuIG9ubHkgd2l0
aCBGSUxFX0FQUEVORF9EQVRBOiBJIGNoZWNrZWQgd2l0aCBhIHRvcnR1cmUgdGVzdCB0aGF0
IA0KPiBXaW5kb3dzIGRvZXNuJ3QgZW5mb3JjZSBhcHBlbmQgYmVoYXZpb3VyIGZvciBGSUxF
X0FQUEVORF9EQVRBfFNZTkNIUk9OSVpFLg0KPiANCj4gRm9yIFBPU0lYIG9wZW5zIHdlIHNo
b3VsZCBhbHNvIGFsbG93IGNvbWJpbmF0aW9ucyBsaWtlIA0KPiBGSUxFX1JFQURfQVRUUklC
VVRFU3xGSUxFX0FQUEVORF9EQVRBIHRvIG1hcCB0byBPX0FQUEVORCwgc28gY2xpZW50cyBj
YW4gDQo+IHdyaXRlIGluIGFwcGVuZCBtb2RlIHRvIHRoZSBoYW5kbGUgYW5kIHN0aWxsIGFy
ZSBhYmxlIHRvIGZzdGF0KCkgaXQuDQo+IA0KPiBodHRwczovL2dpdGxhYi5jb20vc2FtYmEt
dGVhbS9zYW1iYS8tL21lcmdlX3JlcXVlc3RzLzM4NjMNCg0KaW4gYWRkaXRpb24sIEkgZ3Vl
c3MgZm9yIFNNQjMgUE9TSVggd2UgbWlnaHQgd2FudCB0byByZXF1aXJlIHRoYXQgdGhlIA0K
Y2xpZW50IHNldHMgb2Zmc2V0PS0yIGluIFNNQjItV1JJVEVTIG9uIGEgaGFuZGxlIG9wZW5l
ZCB3aXRoIGFwcGVuZCANCnNlbWFudGljcywgcmV1c2luZyB0aGUgbG9naWMgZnJvbSBNUy1G
U0EuDQoNClRoaXMgYXZvaWRzIGJyaW5naW5nIGluIHRoZSBhbWJpZ3VpdHkgb2YgUE9TSVgg
dnMgTGludXggcHdyaXRlKCkgDQpPX0FQUEVORCBiZWhhdmlvdXIgaW50byB0aGUgcHJvdG9j
b2wgYnkgY2xlYXJseSBzcGVjaWZ5aW5nOiBpZiBhIGhhbmRsZSANCmlzIG9wZW5lZCBpbiBh
cHBlbmQgbW9kZSwgYWxsIHdyaXRlcyBhcmUgdXNpbmcgd3JpdGUoKSB3aXRoIE9fQVBQRU5E
IA0Kc2VtYW50aWNzIHdoaWNoIGFyZSBjbGVhcmx5IHNwZWNpZmllZC4NCg0KTG9va2luZyBh
dCBwb3NzaWJsZSBzZXJ2ZXIgaW1wbGVtZW50YXRpb25zLCBpdCBzZWVtcyBib3RoIExpbnV4
IGFuZCANCkZyZWVCU0Qgbm90ZSBpbiBtYW4gcHdyaXRlKCkgdW5kZXIgQlVHUywgdGhhdCBh
IHB3cml0ZSgpIG9uIGEgaGFuZGxlIA0Kb3BlbmVkIHdpdGggT19BUFBFTkQgaWdub3JlcyB0
aGUgb2Zmc2V0LCBzbyB3ZSBpbiBTYW1iYSB3ZSBjYW4gY29udGludWUgDQp0byB1c2UgcHdy
aXRlKCkgaW4gU01CX1ZGU19QV1JJVEUoKSBkZWZhdWx0IGJhY2tlbmQuDQoNClRvIGF2b2lk
IHJlbHlpbmcgb24gQlVHUywgd2UgY2FuIGNoZWNrIGZvciBhbmQgdXNlIHB3cml0ZXYyKCkg
d2l0aCANCmZsYWdzPVJXRl9BUFBFTkQsIGF0IGxlYXN0IG9uIExpbnV4Lg0KDQotc2xvdw0K
DQo=

--------------0ZlhA8gIZUHnPeOYNX08q0qJ--

--------------kxJsDW9MTKz3uyXAfD8rm7c9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcv1XEFAwAAAAAACgkQqh6bcSY5nkY9
ig/+LNW+16VjYLPh9750o7KFgn0GBCEYC0Oa2JrDQkX3r16p6T723sDrCEQFfJjFwjPI/u707Cpf
OOqryhkjZkoMiAi6u9cWfGyX0uJQ72/EytDidSgFhytvGHUlQ0yc7Zf16qtaM2oA1iL8eOO7mDZT
bB8i/2TgJ7PvRpzB0fauSb7rI3gghi2Wr+cWS5u5D9+TFLq1uRn/kg+zkQqZAo6vSoGlmioOUofi
BizQZTFYprcflxFcdSE7ypwa5kNI4vkEmhiUMDlV74IwcGSOt+9PEjW12Si9Pjy/QymeoS75jRuX
xt8s/yw6JAZVbs1IQJqt/pKnbFOINfvmt8FHmyMwIehEcYR6YCN64XhbZcBBcgp5jMz5+5L3GYoz
gEi2jqkNT+qdWuGhyXU+L0STMmLSscxCPp9P1Xfo2Ffmp9k928vB3ntbAySEl5e6FED/kbVBwHVF
TWUyrndPHMhs4Yv6J8iyJjk2pTD2jnp+kZUWXnOLCrWVpxZmNIYvKPIplz5C8H6O94iHlRgDlC35
ctjLDCU6SuXJ0bd8hcwxSsbN628j83NaC7827iZWIrHkU4DC4sb1ijVezwHJxt4Y5tdhXds2Jof7
6KVcpQZQYL7+4VnhjJmcWdmHbN4YnRlHme1FF4O/3jvsAvzsrnZn0SqHfCyt1PeCkGSZEgi206O8
sPY=
=N1wJ
-----END PGP SIGNATURE-----

--------------kxJsDW9MTKz3uyXAfD8rm7c9--

