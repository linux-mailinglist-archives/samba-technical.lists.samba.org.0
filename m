Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0398D9AFFDE
	for <lists+samba-technical@lfdr.de>; Fri, 25 Oct 2024 12:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xOOgkJbcaAMuFyb33IPHKGgQZjwKQRoRk6sZi3V13as=; b=F/wZ5oimQG3KoMXIE7j/fFttrx
	zfm7tyzFz4Mwm5097cFgUSW4oF6HMC41JeRPc9bdGfx2JJB5LNhiRYTSRxWtV93ttXf5o/To6XyHV
	Jao+1vxEI8tK4cmOkXuNfPnDgdeOFGlDlh7XwRiAlveldNNLWM4vXx1+rewYtv2/5xn+zx/HA/J+O
	PRTHp8GrHU2/BHwuDADWIrrXIq75yvowTIILGgum0hGf7+L9FUMCaiSKSLmUVZOya6OQoCR+odFHl
	juRoBKb8e5SybBpBlHS0vexur+RMCpuqRC/MAIYQSyhkBXr9nCFl9JQ5JIQg/tcI/BBvpPzXxYiF3
	3Ruo9Row==;
Received: from ip6-localhost ([::1]:54594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t4HOT-004znH-Uf; Fri, 25 Oct 2024 10:18:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45462) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t4HOL-004zmp-Hx; Fri, 25 Oct 2024 10:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=xOOgkJbcaAMuFyb33IPHKGgQZjwKQRoRk6sZi3V13as=; b=JjaEt6wQbMJnKGQlgzidW3oyDh
 BPhAoub9ZUAYshLF2pkbA7W2JxcKItaJ9KSt8X76GhUZK/9oZ3N6qtHdi5Xp38r9lvSB+xGPnILUy
 2tG3nw5fVnDBkAnznBXj3nZ8mDKwosQjSdzTZc6fHfwVXnLuGmFaiFro9N7QeZpjbFDsX3hgYsuaB
 zoJSuAwdeKr6H9rnFdV6NonzZeNoWgc0DlCSBaYMgWKrcZXyma53q9/e9O+EBtaAuI8xbsQysKQiA
 Ezm66aUMKJESn1I4++H37MKreVZD+2sZcm2223VSMbRmStXM5Ds2yh2b0BzyXerbC28HyKWmyNYzS
 Eg2xhpcXWxvSO2KxO/jimzuD9zy0Vmje441LIyEE6Va1UhfUZ5CvNzezUSdle85t9/H/pkp18c0g9
 cxC72Xpu1YhNfZfLefXT+7lfTSsDQ9wnLpPU03J8JlJjvzODwmugQWJMRwXnUGOFzqrljBmwjWqiv
 vVOuRMHvdG0Uimxnssz93GVn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t4HOK-006YQH-2k; Fri, 25 Oct 2024 10:18:00 +0000
Message-ID: <6d3bc56e-ffd3-491a-9e80-fa5deadfcebf@samba.org>
Date: Fri, 25 Oct 2024 12:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Samba] SambaXP 2025
To: sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <280dfadf-cf54-4cd1-b98e-1248686decc4@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <280dfadf-cf54-4cd1-b98e-1248686decc4@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UDFLcr0bdD71GAVnXP0TUTmz"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UDFLcr0bdD71GAVnXP0TUTmz
Content-Type: multipart/mixed; boundary="------------NrxThrJbiiRST0e0EhMWY0oh";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <6d3bc56e-ffd3-491a-9e80-fa5deadfcebf@samba.org>
Subject: Re: [Samba] SambaXP 2025
References: <280dfadf-cf54-4cd1-b98e-1248686decc4@samba.org>
In-Reply-To: <280dfadf-cf54-4cd1-b98e-1248686decc4@samba.org>

--------------NrxThrJbiiRST0e0EhMWY0oh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsIQ0KDQpUaGVyZSdzIGJlZW4gYSBjaGFuZ2UgaW4gdGhlIHNjaGVkdWxlIGZvciBT
YW1iYVhQJzI1Og0KDQpUaGUgY29uZmVyZW5jZSBkYXlzIGhhdmUgYmVlbiBtb3ZlZCBmcm9t
IFdlZG5lc2RheStUaHVyc2RheSB0bw0KDQpNb25kYXksIDA3LjA0LjIwMjUgdW5kIFR1ZXNk
YXksIDA4LjA0LjIwMjUNCg0KaW4gdGhlIHNhbWUgd2Vlay4NCg0KVGhlIHJlYXNvbiBmb3Ig
dGhpcyBpcyBhIHlldCB0byBiZSBhbm5vdW5jZWQgZXZlbnQgdGFraW5nIHBsYWNlIGZyb20g
DQpXZWRuZXNkYXkgdG8gRnJpZGF5IGF0IHRoZSBzYW1lIHZlbnVlLg0KDQpXZSBsb29rIGZv
cndhcmQgdG8gc2VlaW5nIHlvdSBpbiBHw7Z0dGluZ2VuIQ0KLVJhbHBoDQoNCk9uIDEwLzEv
MjQgMjo0NiBQTSwgUmFscGggQm9laG1lIHZpYSBzYW1iYSB3cm90ZToNCj4gRGVhciBTYW1i
YSB1c2VycyBhbmQgaGFja2VycywNCj4gDQo+IEknbcKgIGV4Y2l0ZWQgdG8gYW5ub3VuY2Ug
dGhhdCBTYW1iYVhQIDIwMjUgd2lsbCB0YWtlIHBsYWNlIG9uIEFwcmlsIDl0aCANCj4gYW5k
IDEwdGggb24tc2l0ZSBpbiBHw7Z0dGluZ2VuLCBHZXJtYW55IG9uY2UgYWdhaW4uIFRoaXMg
YW5udWFsIGV2ZW50IA0KPiBwcm9taXNlcyB0byBicmluZyB0b2dldGhlciBTYW1iYSBlbnRo
dXNpYXN0cyBhbmQgZXhwZXJ0cyBmb3IgYW4gDQo+IGludGVyZXN0aW5nIGFuZCBlbmpveWFi
bGUgdHdvLWRheSBjb25mZXJlbmNlLg0KPiANCj4gRWFybHktQmlyZCBUaWNrZXRzIGFyZSBu
b3cgYXZhaWxhYmxlIGhlcmU6IGh0dHBzOi8vc2FtYmF4cC5vcmcvDQo+IA0KPiBUaGUgY2Fs
bCBmb3IgcGFwZXJzIGlzIGFscmVhZHkgb3BlbiBhbmQgd2UgYXJlIGxvb2tpbmcgZm9yd2Fy
ZCB0byANCj4gaW5ub3ZhdGl2ZSBhbmQgZW5nYWdpbmcgc3VibWlzc2lvbnMuDQo+IA0KPiBJ
ZiB5b3UgaGF2ZSBpZGVhcywgcXVlc3Rpb25zLCBvciBhbnkgaXNzdWVzIHJlbGF0ZWQgdG8g
eW91ciANCj4gcGFydGljaXBhdGlvbiwgcGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byByZWFj
aCBvdXQgdG8gdGhlIExvY2FsIA0KPiBPcmdhbml6aW5nIENvbW1pdHRlZSAobG9jQHNhbWJh
eHAub3JnKS4gV2UgYXJlIHJlYWR5IHRvIGFzc2lzdCBhbmQgbWFrZSANCj4geW91ciBTYW1i
YSBlWFBlcmllbmNlIGFzIHNtb290aCBhcyBwb3NzaWJsZS4NCj4gDQo+IExvb2tpbmcgZm9y
d2FyZCB0byBzZWUgeW91IGluIEfDtnR0aW5nZW4hDQo+IC1SYWxwaA0KPiANCj4gDQoNCg==


--------------NrxThrJbiiRST0e0EhMWY0oh--

--------------UDFLcr0bdD71GAVnXP0TUTmz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcbcFcFAwAAAAAACgkQqh6bcSY5nkam
4g//f59Y3UYSWcS1QvJCF2iIfMZrC63qZI7lJrec8/KYqXgSkvrBalYTS/T9qEfHAcTSLhT6EmhV
kfR7lPEDMC2OaTpgF7GCkHJsrMSxEnEba9pMc7/oAiYBvtxOwibSuw/krqD6SJTumW4pn0N8joxG
zcnckR0LJIqprVGpkwoRIuuICP+CVyaZhxwg10Ksnc4JrRrDP6R3bkNgbm0L1Se8VJ3hyIC9bb7l
qiFt7h9Bramdu3ymlKrc7AwN/E3X+il6SRVgQrKdmbZoDsnmYVcibUog/G712YK8YHwCvVo+lY4f
X10b0BXSxoWx6wCDDqWBN7ldbKvmq6tY1hyLkcf9zNgov5nK8irTic/vBg8AsPeOmNsS1q2Q17a3
apiYuQOncYep5GU6nrprJT0exLHjm+smcg5yYjtxeRGadePSO3Ld44ygwc8D78ozsPJIZ88XAvi9
xNUJXGLt6Mt8ool4rpX5ON7OPF5upK9/qOxDJZICdhhhJRMznvRVASEuifBeZm7Vma3E2OIgPVaL
kN3Zu98B6cPm1zxLaRvsSSE0+g+f3qTgEITFRDbSjcLY+dB5Mbti2OV8bBYtBisuzSBCGhEecO70
0Ap8QkvKvTf2ggwATaZq03C3zMa9mBGaH8XhwoMQXSfa4b/A+5m3wTh4CgJtc+P7XS1SdCVPDAwW
/d0=
=vnuE
-----END PGP SIGNATURE-----

--------------UDFLcr0bdD71GAVnXP0TUTmz--

