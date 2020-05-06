Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ADD1C7399
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 17:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=uQM/cQVafwNmD7Wo0TeUpVvm7dI1YqAjP6RvPTXWlPs=; b=kEXwlVBtgN+m0kJZOCeFSY/6fe
	5wZmWVhlav+XlHi91hg+UZuLzKG1FTK2+mouZwPtA5zMkCCi77pYeSJT7Q0DZw51bkHIXhvryZ5Zg
	CfsVW6weq/pBynXruPcDahUzwFotNziW9o8NIOmrPWYJzyc/OxDS/wWJLCvEWFfMI3vygWZRwizpI
	BJE242E5l08VjBbWSIqfMb1OSxBVknMygNg255kHqyVrQ34tLtL2/uEYpxHoCO15TgnIMefP7UyJX
	OFh8v7Bp0FAoELkSloB5SZDJu2+ZB6H8tXDIb4NSCoktuB1kuxMn5Ef2rCKHhTJSKuAMr5McdRknr
	8XNlSEGQ==;
Received: from localhost ([::1]:44108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWLdW-0031zs-2N; Wed, 06 May 2020 15:07:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37870) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWLdP-0031zk-Nq
 for samba-technical@lists.samba.org; Wed, 06 May 2020 15:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=uQM/cQVafwNmD7Wo0TeUpVvm7dI1YqAjP6RvPTXWlPs=; b=n31Oc8XXgazSQj/8XIeo6z3TjA
 4hJ3YanAIpT6IsutaODO5T6NyLJ7rYxLG6biRqjcgQSBCKh2zLvch2xeel3J6O6BWN5yZ7OA53gV7
 9X9rI7dRXDs9vc1wCgisoHj35pO9gWCV/6KTUxYEtN66ONlQ8DzIvUWpVY9gpFGp4tDug69ebB0fa
 78I9u6P+qFeglX0TRo4nSZb9SvXk6o0poFclkd/JTuj95OaY6jejpTZPquIt1tURKGrCv9tWfxFUT
 LGvOE7Ld5S5S/gc96/JzXHXZ/0wC8iI85IVL1Dt7hkWHhiNIazqWFqnLzjeyNedEgUFpR18ERMYrB
 oZfubB0VdXvsaV23/Id2bUfI3VyPwIQv8I4rSCTy/ab6Q4ZpNdpeJeJ2kkIuoFIyKK4H594jVBka9
 +vAiT5thpR2wUgaik9LLL7GyYU9K1W3v18geg3exS8ubOgXN9CZtJ4FYgmxh9HEWl0hh4svXmz14y
 Oya11MpaZvTkDYHtNmCPp1jU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWLdN-0006wV-Gn; Wed, 06 May 2020 15:06:53 +0000
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Andreas Schneider <asn@samba.org>, Anoop C S <anoopcs@cryptolab.net>,
 Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>
 <36fd1c62-abfb-931c-ac31-f6afbbb313fb@samba.org>
 <27882183.aulKxNbigu@magrathea>
Message-ID: <cd503d40-598f-f896-67c3-70e6dedf0ea9@samba.org>
Date: Wed, 6 May 2020 17:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <27882183.aulKxNbigu@magrathea>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="qqNpKEXwhUd9USb6uE330iYEzCKLxcXHy"
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
Cc: Jens Axboe <axboe@kernel.dk>, io-uring <io-uring@vger.kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qqNpKEXwhUd9USb6uE330iYEzCKLxcXHy
Content-Type: multipart/mixed; boundary="jSElaRyXFvf7LOc5ZE8eEBg5K1W1moogp";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andreas Schneider <asn@samba.org>, Anoop C S <anoopcs@cryptolab.net>,
 Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
Cc: Jens Axboe <axboe@kernel.dk>, io-uring <io-uring@vger.kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <cd503d40-598f-f896-67c3-70e6dedf0ea9@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>
 <36fd1c62-abfb-931c-ac31-f6afbbb313fb@samba.org>
 <27882183.aulKxNbigu@magrathea>
In-Reply-To: <27882183.aulKxNbigu@magrathea>

--jSElaRyXFvf7LOc5ZE8eEBg5K1W1moogp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 06.05.20 um 16:46 schrieb Andreas Schneider via samba-technical:
> On Wednesday, 6 May 2020 16:08:03 CEST Stefan Metzmacher via samba-tech=
nical=20
> wrote:
>> Am 06.05.20 um 14:41 schrieb Anoop C S:
>>> On Wed, 2020-05-06 at 12:33 +0200, Stefan Metzmacher wrote:
>>>> Hi Anoop,
>>>>
>>>>> I could reproduce the difference in SHA256 checksum after copying a=

>>>>> directory with 100 copies of test file(provided by reporter) from
>>>>> io_uring VFS module enabled share using Windows explorer(right-
>>>>> click-
>>>>>
>>>>>> copy/paste). Only 5 out of 100 files had correct checksum after
>>>>>> copy
>>>>>
>>>>> operation :-/
>>>>
>>>> Great! Can you please try to collect level 1 log files with
>>>> the patch https://bugzilla.samba.org/attachment.cgi?id=3D15955
>>>> applied?
>>>
>>> I have attached three log files.
>>> log.io_uring.smbd -- Copy using Windows explorer
>>> log.io_uring-mget.smd -- Copy using smbclient
>>> log.io_uring-powershell.smd -- Copy using `Copy-Item`
>>
>> Thanks! All of them show short reads like:
>>> [2020/05/06 17:27:28.130248,  1]
>>> ../../source3/modules/vfs_io_uring.c:103(vfs_io_uring_finish_req)>=20
>>>   vfs_io_uring_finish_req: pread ofs=3D0 (0x0) len=3D32768 (0x8000)
>>>   nread=3D32768 (0x32768) eof=3D10000000 (0x989680) blks=3D4096 block=
s=3D19536
>>>   dir/1.bin fnum 1607026405>=20
>>> [2020/05/06 17:27:28.131049,  1]
>>> ../../source3/modules/vfs_io_uring.c:103(vfs_io_uring_finish_req)>=20
>>>   vfs_io_uring_finish_req: pread ofs=3D9969664 (0x982000) len=3D30336=
 (0x7680)
>>>   nread=3D30336 (0x30336) eof=3D10000000 (0x989680) blks=3D4096 block=
s=3D19536
>>>   dir/1.bin fnum 1607026405>=20
>>> [2020/05/06 17:27:28.133679,  1]
>>> ../../source3/modules/vfs_io_uring.c:103(vfs_io_uring_finish_req)>=20
>>>   vfs_io_uring_finish_req: pread ofs=3D61440 (0xf000) len=3D32768 (0x=
8000)
>>>   nread=3D32768 (0x32768) eof=3D10000000 (0x989680) blks=3D4096 block=
s=3D19536
>>>   dir/1.bin fnum 1607026405>=20
>>> [2020/05/06 17:27:28.140184,  0]
>>> ../../source3/modules/vfs_io_uring.c:88(vfs_io_uring_finish_req)>=20
>>>   vfs_io_uring_finish_req: Invalid pread ofs=3D0 (0x0) len=3D1048576
>>>   (0x100000) nread=3D32768 (0x32768) eof=3D10000000 (0x989680) blks=3D=
4096
>>>   blocks=3D19536 dir/1.bin fnum 1607026405
>> It seems the first request is at ofs=3D0 len=3D32768 (0x8000) and we g=
et
>> 32768 back.
>> A follow up request with ofs=3D0 len=3D1048576 (0x100000) only gets th=
e
>> first 32768 bytes which are already in the page cache.
>>
>> I can easily reproduce this with the Ubuntu 5.4 kernel once I add
>> state->ur.sqe.rw_flags |=3D RWF_NOWAIT; to vfs_io_uring_pread_send()
>> and use this.
>>
>> echo 1 > /proc/sys/vm/drop_caches
>> head -c 1024 /root/samba-test/ff1.dat | hexdump -C
>> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
>>
>> |................|
>>
>> *
>> 00000400
>> smbclient //172.31.9.167/uringff -Uroot%test -c "get ff1.dat"
>>
>> results in this log entries:
>>> [2020/05/06 06:51:57.069990,  0]
>>> ../../source3/modules/vfs_io_uring.c:89(vfs_io_uring_finish_req)>=20
>>>   vfs_io_uring_finish_req: Invalid pread ofs=3D0 (0x0) len=3D8388608
>>>   (0x800000) nread=3D16384 (0x4000) eof=3D8388608 (0x800000) blks=3D4=
096
>>>   blocks=3D16384 ff1.dat fnum 840153065>=20
>>> [2020/05/06 06:51:57.076882,  1]
>>> ../../source3/modules/vfs_io_uring.c:104(vfs_io_uring_finish_req)>=20
>>>   vfs_io_uring_finish_req: pread ofs=3D16384 (0x4000) len=3D8372224 (=
0x7fc000)
>>>   nread=3D8372224 (0x7fc000) eof=3D8388608 (0x800000) blks=3D4096 blo=
cks=3D16384
>>>   ff1.dat fnum 840153065
>> smbclient is just smart enough to recover itself from the short read.
>> But the windows client isn't.
>>
>> The attached test against liburing (git://git.kernel.dk/liburing) shou=
ld
>> be able to demonstrate the problem. It can also be found in
>> https://github.com/metze-samba/liburing/tree/implicit-rwf-nowaithttps:=
//gith
>> ub.com/metze-samba/liburing/commit/eb06dcfde747e46bd08bedf9def2e6cb536=
c39e3
>>
>>
>> I added the sqe->rw_flags =3D RWF_NOWAIT; line in order to demonstrate=
 it
>> against the Ubuntu 5.3 and 5.4 kernels. They both seem to have the bug=
=2E
>>
>> Can someone run the unmodified test/implicit-rwf_nowait against
>> a newer kernel?
>=20
> $ uname -a
> Linux magrathea 5.6.8-1-default #1 SMP Thu Apr 30 10:47:01 UTC 2020 (63=
116ab)=20
> x86_64 x86_64 x86_64 GNU/Linux
> $ ./a.out=20
> cqe res=3D4096 !=3D 8192

Thanks for confirming, it passes fine on 5.3 and 5.4 kernels.

metze



--jSElaRyXFvf7LOc5ZE8eEBg5K1W1moogp--

--qqNpKEXwhUd9USb6uE330iYEzCKLxcXHy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6y0oQACgkQDbX1YShp
vVZBbxAAhfQJi8OiGKp6RJIpecgNwShrktluwlyzt1lDApQgznYOGYYfvsebQv9H
GC+xOY+GJ65ao3joSXW3lHSzeSTTLWzPx7mH4LsVjKlDtfnJ5jnKfn+IODJl0bEz
h1L5s2Xy263UBkrE5863yGZYCSp27OsyO4ETj/rzYVWJ24VNiJOJjmvY3rQuZ92e
ekeeIJJRL3Jiw2SeuY9iTsNloVLLygAAfjZ7Dpo08ENGpHrwC5S9tEDM9PyZoZie
pGo/gMUNojhUmqAfrzR1lU3UUMNrY8gbgt3pQSIT+eUjkkhaYppTpksvqSNs9x/M
GwhDMy10WTciH9OerR7gii42Rp9W0h/HcqBG8B9dV84scEyLKSO+Kio5GmQUQlYV
57VWj+oHgwXpAzIitVEvV2IxhwppPmeyGdyHOoA+OObQd+p4PmJ1alEYb/MoN9nQ
OQSNNmtTpWQ8mXBGbQQ4SGc7xwMiM3hl02jtSmvVCvPoNT4+v641rVimmuEbyR9L
lvXB2i7Ex3NzSySCv02GZQ1ftn2/H0c9b/VlH1gMQcTwQh7zQRhvB8QcPpiQWjWV
ycFqHhssYmBrB0r7v4V4MRMC4NVg/boT4u0cQib/hnDATwkI37ySgkZ2N7GFPrGb
qeas+8gAgy3e3Pg2WHWxcaB+kvZ3vfW+b6m3rSHgU4VNsSJLIVw=
=OY+C
-----END PGP SIGNATURE-----

--qqNpKEXwhUd9USb6uE330iYEzCKLxcXHy--

