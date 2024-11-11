Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 573489C40FB
	for <lists+samba-technical@lfdr.de>; Mon, 11 Nov 2024 15:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4GUlfCMxQKnfsAfjR39tVWKQ8fYrxUAQD6kjwrMtjLM=; b=lUFxCLaprVFBYEiy5waP1gTz+l
	lgrbyrChIapVP/zJuoK1FnsHf5Ad6+xuMoroIUwoNfwTsq/y+FadSvuol6Ww5AmHWFaBAkFp2fZjl
	xaXxa6MFM4hZq9ThLGcGqCFfLCgaS7fT9u3MDQbPsqwLXWPnyLclbpjKrKEUYYC3DOi3sv4QHKsG7
	ddHq9rKRj8GMCI9LcgW7k2npd6DqnGUn9VdTqxmTAjsw1QBQSdmrqVcLzQqoCUHSZPdiC61DNzyt1
	+zV2FdbYBD7flAqcRtIXFEYd3ShGjFUDicKws5y6Z1tWqyrA/IWLpKtg2tVOGIg/Pwk2dASJb1Yqy
	qb+gcB9A==;
Received: from ip6-localhost ([::1]:34646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tAVS0-008IZk-EM; Mon, 11 Nov 2024 14:31:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34514) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tAVRu-008IZd-G2
 for samba-technical@lists.samba.org; Mon, 11 Nov 2024 14:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=4GUlfCMxQKnfsAfjR39tVWKQ8fYrxUAQD6kjwrMtjLM=; b=bVrks/JITS88Dk/viO1UPAUBpK
 aanUi3WpoDLkhXOSXDztSTJYP+aK87OYeL3BIRFWH0VDSyO+qG84kqo9NqEztz9Fqdx8wjnlgjUJF
 W7F6R+uX+ipE0DCbdpmaEhoF32yeU6u9lwiPNV1A7pVJZq+dlwh4M2HI9jvWkhYKOqSWgX64UCtMN
 pTqFBIhtzLew3FFE+dCRpOYDqFE88rQlNx9matZgCNW4OY9APqKDIDulfDJC5d0Setiiwn/O9gp8/
 wdtfmdgHgNIsjl0sLPsw+pl7nqcaq5VJI+LXGYCxYqzlfCm2yb8oL81p2CAokdTHSTn6I1se+nnCM
 6T7K73CzStt6IkNk2VUY+h+bIO2bt/fXjdMTS6/k5egE8voAL22vhk9zIAmwJ/5fGv+rmESYIXM+l
 bD8Opjr2UWFlzINRzk5EWuJ1tKLzAQUrODYvGDCZV57Nf8JrOKt7aBeis8RQxM9twO5XDbxJRrAt1
 WtZCkwpU/hOFB1X3UGjsLiXK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tAVRt-00A3q3-1S; Mon, 11 Nov 2024 14:31:25 +0000
Message-ID: <a5b250c9-8f69-4a48-86cb-f5347dfc4a2e@samba.org>
Date: Mon, 11 Nov 2024 15:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
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
 <2eb2e4fa-1e74-46d4-a399-0200dd08e348@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <2eb2e4fa-1e74-46d4-a399-0200dd08e348@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0ozO4QW0RhLvr5txCpT9QreH"
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
Cc: Volker Lendecke <Volker.Lendecke@SerNet.DE>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0ozO4QW0RhLvr5txCpT9QreH
Content-Type: multipart/mixed; boundary="------------UBshE0RYAoyBn22aQQ6nh0vv";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Cc: Jeremy Allison <jra@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>
Message-ID: <a5b250c9-8f69-4a48-86cb-f5347dfc4a2e@samba.org>
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
 <2eb2e4fa-1e74-46d4-a399-0200dd08e348@samba.org>
In-Reply-To: <2eb2e4fa-1e74-46d4-a399-0200dd08e348@samba.org>
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

--------------UBshE0RYAoyBn22aQQ6nh0vv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvOS8yNCA1OjE4IFBNLCBSYWxwaCBCb2VobWUgd3JvdGU6DQo+IE9uIDExLzkvMjQg
NDoyNiBQTSwgUmFscGggQm9laG1lIHdyb3RlOg0KPj4gT24gMTAvOS8yNCA5OjQzIFBNLCBK
ZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4+PiBDYW4gd2UganVzdCBtYXAgKGFjY2Vzc19tYXNr
IChGSUxFX0FQUEVORF9EQVRBfFNZTkNIUk9OSVpFKSkgPT0gDQo+Pj4gKEZJTEVfQVBQRU5E
X0RBVEF8U1lOQ0hST05JWkUpKQ0KPj4+IHRvIE9fQVBQRU5ELCByZWdhcmRsZXNzIG9mIFBP
U0lYIG1vZGUgPw0KPj4NCj4+IHRoaW5raW5nIGFib3V0IHRoaXMgYSBiaXQgbW9yZSwgdGhp
cyBzZWVtcyBkb2FibGUsIGFsYmVpdCBvbmx5IGZvciANCj4+IFBPU0lYIG1vZGUuIEZvciBu
b24tUE9TSVggbW9kZSB3ZSBjb3VsZCBwb3RlbnRpYWxseSBicmVhayBXSW5kb3dzIA0KPj4g
YXBwbGljYXRpb24gdGhhdCBvcGVuIG9ubHkgd2l0aCBGSUxFX0FQUEVORF9EQVRBOiBJIGNo
ZWNrZWQgd2l0aCBhIA0KPj4gdG9ydHVyZSB0ZXN0IHRoYXQgV2luZG93cyBkb2Vzbid0IGVu
Zm9yY2UgYXBwZW5kIGJlaGF2aW91ciBmb3IgDQo+PiBGSUxFX0FQUEVORF9EQVRBfFNZTkNI
Uk9OSVpFLg0KPj4NCj4+IEZvciBQT1NJWCBvcGVucyB3ZSBzaG91bGQgYWxzbyBhbGxvdyBj
b21iaW5hdGlvbnMgbGlrZSANCj4+IEZJTEVfUkVBRF9BVFRSSUJVVEVTfEZJTEVfQVBQRU5E
X0RBVEEgdG8gbWFwIHRvIE9fQVBQRU5ELCBzbyBjbGllbnRzIA0KPj4gY2FuIHdyaXRlIGlu
IGFwcGVuZCBtb2RlIHRvIHRoZSBoYW5kbGUgYW5kIHN0aWxsIGFyZSBhYmxlIHRvIGZzdGF0
KCkgaXQuDQo+Pg0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvLS9t
ZXJnZV9yZXF1ZXN0cy8zODYzDQo+IA0KPiBvaCwgZm9yZ290IHRvIG1lbnRpb24gdGhhdCB0
aGlzIGZpeGVzIHRoZSBmYWlsaW5nIGNvcHlfY2h1bmsgY29weSBmcm9tIA0KPiB0aGUgTGlu
dXgga2VybmVsIGNsaWVudCBpbiBwb3NpeCBtb2RlLg0KDQphbHNvIGFkZGVkIGEgdGVzdCBm
b3IgdGhhdC4NCg0KLXNsb3cNCg==

--------------UBshE0RYAoyBn22aQQ6nh0vv--

--------------0ozO4QW0RhLvr5txCpT9QreH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcyFTwFAwAAAAAACgkQqh6bcSY5nkYi
cg//ZmjO9kRk4x5b/LQOeyquasW0WyySe+NdGb7vKEj84yn8FZwuy6SDFailEu+4G9mUFC3m6nQk
uiVG4xV/nBIFi6gQd0Dqd3N1e64XHCJde6rMaqT8LGGWAnkTAIpd3JGddHEWf1Mt2jN4ia1N3WdI
2E6NiioLFqn7B1E8WjyRqz0mtEksnRChoPSuhWqfg14OosaT6RKvpPUNfiDvGqad6jl9gqiPTIyh
nWNyh8RY9Fu/KCT8Sx9585pv713l8p49XZmB33FTMgNeZC0HDSJxdqdCU1qWooMnS8aVJiVJran4
ftlayfNi4qK5CVxr3DP4mloA6wpMOjYe9bnSfEPL994NLbE9Rvog9jhBSNiLagoq0cooAW91PyaP
P1TDhLfny+wJ9PU28EfXSPR+WuO3EaAAqNng+If/CClg75BnnL7OCIRViYMWc65yXNTdkGdycJZD
xj1fTPSi6SskO1QdCdMScZ20LX31BITTqlmyDOR4D76fG1XY4JjDqlkKTNeXQaCBT8558JNr7X2t
4xs+mN4/5U/+8cyb9CdptPH9l6VJ6ykSBjZml3Z93th2HsJ45bZBYrYtMlfbOsLT9qCTSCD0u2xU
/Fjg3Dt5Gwek1dBijJh6B/EyAcbnVIjLaCPOwaXy4G2iyJOgRUWWtzIgBwTj3b3lGeQmYd4fnwx/
v7g=
=K+Rz
-----END PGP SIGNATURE-----

--------------0ozO4QW0RhLvr5txCpT9QreH--

