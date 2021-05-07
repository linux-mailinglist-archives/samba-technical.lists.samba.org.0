Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF7376569
	for <lists+samba-technical@lfdr.de>; Fri,  7 May 2021 14:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bfYI7e13RH75025FJ0WasUEoCm7NMJOe1Lw/CnNAfYE=; b=JP+SVpOwQZNE4sArEeWUET8EI+
	eIKClwBNqwtya8RlRv4ECiHC/8zkGpc/GX4i1kayAD0uX1zod482Bk1yCHhYu/K8U8JqyxAuPCE7H
	9XoYjiPKGpT/qvQyTZB60bgkDiM2dKQZoaJl6DyX+fQ/Piu9pGT1+9lAvCwkNIHa3Y2AzHWm8T7YK
	3+dOF88jPnVaPPwQ/J/Ay6Mlg/BWFdhE2dEcKfhkcHSU3U3OcjFBBFC+Pp40agOIsP2NilH5crYuu
	rfMaExYQ3MVhdfxP6fpTJEUTrwTwbfIK+Ae1XkZSoWpqfM2yzZ3kyq41/XbGixcu0kekhdVaGzfd/
	OxHQkKwQ==;
Received: from ip6-localhost ([::1]:42942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lezpB-00GKta-DL; Fri, 07 May 2021 12:43:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27342) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lezp5-00GKtR-Vk
 for samba-technical@lists.samba.org; Fri, 07 May 2021 12:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=bfYI7e13RH75025FJ0WasUEoCm7NMJOe1Lw/CnNAfYE=; b=0GcnvzuiNVdQ+Fl3mxTOdGWGkp
 WDsJS7ihQ/MtbHG14eD4SXP0NfL4U83QHXMZ7b3vhr6LkGatfQ+LokldXnHByYutPufMqf9ki94Cc
 EwjNikYeAYY/C1h8BCUUNrz7a+PnP1CdMRD0tOHe3ijdsXCUDwHvTRYPaeVvpc1i4/FQqi1P4wKa5
 Owm5sMBqLHj+GPfoY3l9qAzINC57jJcmp55v9IqK8wSpkQYBNIuXKr5pPYMvCYcmEUG2Z8IMt+MPz
 JwgOoJGNCnh9R41foJvN3jTm0+eEgLmUFsgU0d+6xNMbRTSAQJDaGFVtmAJH0S3S4n9gQsT+3jwE+
 /E2Giw2TxvJk04387WWIAftA5xiN/FFcjrUwHYMXcSdOp4oYa86Ra92qLXi+pRSCKw3zZ51ynwxZT
 adVp3ErjE4x/JQ7ZAmmAaGrVKM6q8eetrzc+u1F/ByA4YNZY62xS62RAes5SXRtYrzuEhZQWRGBLV
 LqLgTgH/rYdW7FtagoYW2xls;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lezp3-0003o1-Nd; Fri, 07 May 2021 12:43:13 +0000
To: =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <c2b84e56-87c6-469d-c272-02731cb0937c@samba.org> <87y2cqu9as.fsf@suse.com>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
Message-ID: <2e20d5e9-148b-dbb2-9fda-50521be46fa5@samba.org>
Date: Fri, 7 May 2021 14:43:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87y2cqu9as.fsf@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tRtXRKwosODW585bvxbqMz1B3Dr5wd5Fk"
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tRtXRKwosODW585bvxbqMz1B3Dr5wd5Fk
Content-Type: multipart/mixed; boundary="UdMDeLavNqkPPifBxkMfkRZ4Dd34xgkBz";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Message-ID: <2e20d5e9-148b-dbb2-9fda-50521be46fa5@samba.org>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <c2b84e56-87c6-469d-c272-02731cb0937c@samba.org> <87y2cqu9as.fsf@suse.com>
In-Reply-To: <87y2cqu9as.fsf@suse.com>

--UdMDeLavNqkPPifBxkMfkRZ4Dd34xgkBz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 07.05.21 um 12:28 schrieb Aur=C3=A9lien Aptel via samba-technical:
> Stefan Metzmacher <metze@samba.org> writes:
>=20
>> Hi Steve,
>>
>>> +/*
>>> + * Dump full key (32 byte encrypt/decrypt keys instead of 16 bytes)
>>> + * is needed if GCM256 (stronger encryption) negotiated
>>> + */
>>> +struct smb3_full_key_debug_info {
>>> + __u64 Suid;
>>> + __u16 cipher_type;
>>> + __u8 auth_key[16]; /* SMB2_NTLMV2_SESSKEY_SIZE */
>>
>> Why this? With kerberos the authentication key can be 32 bytes too.
>=20
> That field should be named sesion_key.
>=20
> We only need 16 bytes for the session key. If the source has less we
> pad, if the source has more we truncate. That's how the specification
> describes it.

No in order to derive the aes256 keys we need the full session key that
falls out of the authentication and that's 32 bytes is kerberos
with aes256-cts-hmac-sha1-96 (the default) is used.

>> Why are you exporting it at all?
>=20
> Wireshark initially derived the keys by itself from the session key and=

> computing the preauth from the trace:
>=20
> Pros: only need to type one thing in Wireshark and it can figure out th=
e
> rest from the trace
>=20
> Cons: The trace needs to contain to negprog&session setup
>=20
> After several complaints, I added a way to directly provide S2C and C2S=

> keys. You can either provide any combination of Sesssion Key, S2C or C2=
S
> and Wireshark will do best-effort to figure things out.

Ok, the it's fine to export all 3.

>>> + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
>>> + __u8 smb3decryptionkey[SMB3_ENC_DEC_KEY_SIZE];
>>> +} __packed;
>>> +
>>
>> As encryption and decryption is relative wouldn't
>>
>> something like smb3_s2c_cipherkey and smb3_c2s_cipherkey be better nam=
es?
>>
>> They are derived with SMBS2CCipherKey and SMBC2SCipherKey as labels.
>=20
> I would call it server_in_key and server_out_key.

That's fine too.

> I think we should have 2 ioctl:
> - GET_FULL_KEY_SIZE: return the size of the struct
> - GET_FULL_KEY: return the struct
>=20
> (note: no __packed, this might create all sorts of issues and kernel AB=
I
> will be stable across the system anyway. I hope we didn't pack other
> ioctl in the past... need to check)

> struct smb3_full_key_debug_info {
> 	__u64 session_id;
> 	__u16 cipher_type;
>         union {
>             struct smb3_aes128_debug_info {
>         	__u8 session_key[16];
> 		__u8 server_in_key[16];
> 		__u8 server_out_key[16];
>             } aes128;
>             struct smb3_aes256_debug_info {
>         	__u8 session_key[16];
> 		__u8 server_in_key[32];
> 		__u8 server_out_key[32];
>             } aes256;
>         } keys;
> };
>=20
> * Users will call GET_FULL_KEY_SIZE to allocate a properly sized buffer=
=2E
> * Users can do a switch on cipher_type and process what they know exist=

> * We can update the struct if we need to in the future without breaking=

>   userspace
>=20
> This should cover any possible updates (AES-512 or some new cipher...)
> unless I'm missing something.

I think we should have explicit length fields for each key, if it's easie=
r
we can still use fixed size arrays.

struct smb3_cipher_key_debug_info {
	__u64 session_id;
 	__u16 cipher_algorithm;
	__u8 session_key_length;
  	__u8 session_key[32];
	__u8 server_in_key_length;
	__u8 server_in_key[32];
	__u8 server_out_key_length;
	__u8 server_out_key[32];
};

SMB3_GET_CIPHER_KEY_DEBUG_INFO would be the ioctl constant.

metze




--UdMDeLavNqkPPifBxkMfkRZ4Dd34xgkBz--

--tRtXRKwosODW585bvxbqMz1B3Dr5wd5Fk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmCVNdgACgkQDbX1YShp
vVZKoQ//TExaaDEMiGcrGf6DDhCaP+TeH2qSDULJkx3CErVzSMjoFOX/8aQOtMIS
LqYlrnSGHWBpVtExqnQ6uDXtEYTNAWsQj6BRIUyNNs9CrFufInbkbCOuUh+cuf2f
5F2YmQZ0eMLJ5zf8CIy8Itx5q7/LRdrhNKv2qWQ2kIUB835n2x1be4kc9CZDR0Ui
TLl0MDncPMIvLmOMF5+Oc3Kig+afVh4CI0qY8/BduQXOOXYoh/aQyETY8GpjRWXe
/ZyoxtVDgOvZcigyui1FMoQqMrGmj7SKG3wHQenLTVdnqkiSdTinYwp7/EHEQ2zL
V8Jdbohsyy6ATbwmNiLxiOcNOIz/fyi+1K3vnQBAppJdRKzGN7uqQ6Z7Ycw0hCFt
XBiN5vu4I674mG+ZTLRJjLQBBtYKWzM9APr+K6EpLvn2KDa2Cg4V9anvlC6/xTud
f723yHNoAovt8FrwpwaIQQKDj7LjPJr+b2BETuVH7EVfUZwpqoVvkRQ5WYX772Gx
5U33lmBeWBjohkGPTsVGxHdoPlMwrAgm2dHrvEOz7qLpN9wVS4BcR9oc+g4Rw1sX
u18z8yAAYwJ69g39a7IogvRh84xvvLyK94b4WIJvF7qjN8CWU6pHERMecop0PtBM
bZpPKNPBI1roMtPFq6JtiPAyPkQbPEeBY3Og3v0Z2pc35VTr/T8=
=++EE
-----END PGP SIGNATURE-----

--tRtXRKwosODW585bvxbqMz1B3Dr5wd5Fk--

