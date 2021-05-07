Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0C3766F2
	for <lists+samba-technical@lfdr.de>; Fri,  7 May 2021 16:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FLGmbryqnUZTI8oPwjjTgXqxusqPK1nV1B9+r0JqCDo=; b=qgVxa38ngsQet56g3VGhc5HQ5B
	YrZ6ansaCqtNr1cZ/37JV3w9R8m8818FdHQ+pMI66uaL58MMkgcew+zf9rICW9lHAnPSHv4xWBcH3
	loeXBATgckTpOLKgmAItEJX8W74/AtMZKt+ZSqOLAZMzy3yn0945ezPkG67PW7iUGsK5C4iAUUOB4
	wwvd6qTb32lXVA4VQQp8WqJux6reyoFci/HILQMdwDEJd2PhBu8ehjtWUABggyvZ5sQlB0YQjHieT
	EWL3sDEnraVqpdBgQ7/CjqkLzPsTlOCoeWt6MU47VdLFEUi8YbfI0nKMUCV2S1h0k3AuPEfIbukVM
	ADSZ6dlQ==;
Received: from ip6-localhost ([::1]:45746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lf1H1-00GMKC-8Z; Fri, 07 May 2021 14:16:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63078) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lf1Gw-00GMK3-PD
 for samba-technical@lists.samba.org; Fri, 07 May 2021 14:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=FLGmbryqnUZTI8oPwjjTgXqxusqPK1nV1B9+r0JqCDo=; b=Rf0UNDSAmKDr3JeRhHrkZ7q68u
 v1a4vjcC5DQmDncerII5kYtAYoxotEBrzRnqWVm0EJXH2FakoFH9LszEXeh8XxiQnpnD5NBspradO
 dg80TgqD2JxRnN5/lpyVnOcPpLwG5KQXqfl0h7/3Zw5lg22kHViDU3hAhW9JGpyeqdKZi6Cw73oIC
 +nOtlDNNd6T93TdiNr5Fe9cMichMFzWYtAmpKDUXKbhVZ3/F0BDwpjrBlvqLYWT7pCgGlsw+dTTmm
 Th0n6l0K+sidj14gTADK06lA3OGgV2MgHhmtewDBUUT2WkHc80ba6vU0YZnULu8OQ9gCYFfqPuPYU
 XkX64LQ5IAqCDkpVIui9u3GLanoqXVjmAHQ0Sc/ZS7qVk4+6j5Jq2dNO2W8t4kbPb10QgTbuqtgQk
 YQAfin9daZjxUIMulDCJmt9fjIRIm0Uggr1f1E+xv1wxIwfRfyh/qf0AkjdttwdghZZ7un572yhjc
 SHuswl/rMu8BBKdFzbIlRY75;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lf1Gv-0004gu-3i; Fri, 07 May 2021 14:16:05 +0000
To: =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <c2b84e56-87c6-469d-c272-02731cb0937c@samba.org> <87y2cqu9as.fsf@suse.com>
 <2e20d5e9-148b-dbb2-9fda-50521be46fa5@samba.org> <87sg2yu18q.fsf@suse.com>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
Message-ID: <1780584e-d602-00c4-6f4b-c112f158148c@samba.org>
Date: Fri, 7 May 2021 16:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87sg2yu18q.fsf@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gvNdfHH7rY4COsDl2ItImy3ZeI73a6YLb"
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
--gvNdfHH7rY4COsDl2ItImy3ZeI73a6YLb
Content-Type: multipart/mixed; boundary="9x1I8onavYicF3G8xjLNadnqUWueGKc50";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Message-ID: <1780584e-d602-00c4-6f4b-c112f158148c@samba.org>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <c2b84e56-87c6-469d-c272-02731cb0937c@samba.org> <87y2cqu9as.fsf@suse.com>
 <2e20d5e9-148b-dbb2-9fda-50521be46fa5@samba.org> <87sg2yu18q.fsf@suse.com>
In-Reply-To: <87sg2yu18q.fsf@suse.com>

--9x1I8onavYicF3G8xjLNadnqUWueGKc50
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 07.05.21 um 15:23 schrieb Aur=C3=A9lien Aptel:
> Stefan Metzmacher <metze@samba.org> writes:
>> No in order to derive the aes256 keys we need the full session key tha=
t
>> falls out of the authentication and that's 32 bytes is kerberos
>> with aes256-cts-hmac-sha1-96 (the default) is used.
>=20
> Ok
>=20
>>> I would call it server_in_key and server_out_key.
>>
>> That's fine too.
>>
>>> I think we should have 2 ioctl:
>>> - GET_FULL_KEY_SIZE: return the size of the struct
>>> - GET_FULL_KEY: return the struct
>>>
>>> (note: no __packed, this might create all sorts of issues and kernel =
ABI
>>> will be stable across the system anyway. I hope we didn't pack other
>>> ioctl in the past... need to check)
>=20
> I've checked and sadly we use __packed for every struct :(
> That means we are forcing users to have packed struct as well which is
> not a standard C attribute. Portable C code will have to process each
> member field manually. I guess clang and gcc both support it so that's
> not a huge deal... anyway that's a problem for another day.
>=20
>>> struct smb3_full_key_debug_info {
>>> 	__u64 session_id;
>>> 	__u16 cipher_type;
>>>         union {
>>>             struct smb3_aes128_debug_info {
>>>         	__u8 session_key[16];
>>> 		__u8 server_in_key[16];
>>> 		__u8 server_out_key[16];
>>>             } aes128;
>>>             struct smb3_aes256_debug_info {
>>>         	__u8 session_key[16];
>>> 		__u8 server_in_key[32];
>>> 		__u8 server_out_key[32];
>>>             } aes256;
>>>         } keys;
>>> };
>>>
>>> * Users will call GET_FULL_KEY_SIZE to allocate a properly sized buff=
er.
>>> * Users can do a switch on cipher_type and process what they know exi=
st
>>> * We can update the struct if we need to in the future without breaki=
ng
>>>   userspace
>>>
>>> This should cover any possible updates (AES-512 or some new cipher...=
)
>>> unless I'm missing something.
>>
>> I think we should have explicit length fields for each key, if it's ea=
sier
>> we can still use fixed size arrays.
>=20
> The problem with this is that if we make the keys bigger for a future
> cipher, old userspace program will send us a buffer of the size of the
> old smaller struct.
>=20
> eg:
>=20
> * user on kernel version N compiles:
>=20
>     struct smb3_cipher_key_debug_info {
>         __u64 session_id;
>         __u16 cipher_algorithm;
>         __u8 session_key_length;
>         __u8 session_key[32];
>         __u8 server_in_key_length;
>         __u8 server_in_key[32];
>         __u8 server_out_key_length;
>         __u8 server_out_key[32];
>     } buf; // sizeof =3D> 16
>    =20
>     ioctl(fd, CIFS_DUMP_FULL_KEY, &buf);
>=20
> * user keeps compiled program and upgrades kernel to version N+1 where =
the
>   kernel added AES-512 or whatever:
>=20
> * in the kernel, sizeof(smb3_cipher_key_debug_info) is now let's say 24=

>=20
>     copy_to_user(userbuf, &kernelbuf, sizeof(struct smb3_full_key_debug=
_info));
>=20
> Since we don't know the size of the user provided buffer and we assume
> it's the same as the current size of the struct, So we will actually
> write past it (24-16 =3D> invalid write of 8 bytes).
>=20
> With the extra ioctl to get the size, userspace will always give us a
> buffer that matches the struct size of the running system.

If you ever change it just use another struct and another ioctl opcode.
also the ioctl macros encode the struct size into the id, the the ioctl o=
pcode would
change anyway.

metze



--9x1I8onavYicF3G8xjLNadnqUWueGKc50--

--gvNdfHH7rY4COsDl2ItImy3ZeI73a6YLb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmCVS6AACgkQDbX1YShp
vVbOyw/+L4PO1hO4yKK3HU6bq1R0/LV/bP02BtY7JLH23bPXPqPoBvTaoIYSN4Ye
RoibgX/DMGbQeRon03tIhCrxXW4zkcUMbMrciFuW3Hk/8x51J4yy5I9UEbd3IWwZ
4Mu00/gEAtvEMld7OkJt/Ohvl+Gonsk0D3zOaViBJFOiozfBqbbXV90Zab0EijnB
AQuXRPaw7O36Rg/vb9qKM05i5sYgN6z09Wf8Cqqt9Y/Jb85tytiHsKbnJliBTasn
PpK/Ad7LMQmvwzz5y7fSTjIOM9Qzoq8W+IWlamn8UAT1QwdcL5A3qzWqk5byIcxI
momcaShw9V7lB4rVNHSEsb/b4DVk810mH8GPpx8X5tgzbwwrkm/lJXp8WoDOqLtp
9BCFQl0tP5bclswD/oNtl+GWCP8c2X5qgFabDbMriTojZIviPGL2nJpN8UaHVAQj
8+xQbcltfC1iwMcEaE1oSH0TBSVsU3G5KHsE2ZZhVPOucg7JPtb0B+wORjhdfooJ
WeDafLAyJnYVpT0c+UsaiQrQROiGdUAmSyXZ/lXBpOy8qmFuo5/k9M0BUIFqbfJQ
TojYToEEj9tcg/yKaXI5nb92sbTedNYqMJD4qKgxwxR++UZXQI8aP4w0fj48TPeY
8ZEWsXHTAPWY7hvyffkDUlYAHI7zsCC6R9M9Kt66x96NjkS8Crs=
=01xA
-----END PGP SIGNATURE-----

--gvNdfHH7rY4COsDl2ItImy3ZeI73a6YLb--

