Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B775F1CBAA4
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 00:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=GZpyhKWxXL7BGCCB55qiO8Fy28rPbx0JmMMavsFngg0=; b=5g1ehu0fw1JwvMz2uVQkTWXywf
	wbcUP+MrjRmn42t/BE/2a9TU088OSx/83lFzcSBYUUu+nyzEKe4Fwq5OC8M5FRwOhzDd5/TaM2MG8
	INmV/VgEwD4LchCONyE/IiRJYCv6XQUUzqudCxnhn8FBqqkpN+3gb7ROiZDeoCMuiY7u3gd5bu3Qe
	TURymKAB3YuekBjpG/JHmHGEFBfTKlLh9IJHirGoz1x29xV7//BCKz5LNliia35+SpqxcVdjHVvrP
	Rf5xl7IgTd02kFCqmEJN8ZGl8dKYAaC7UPG2sctJdcUM/3onpc7cVSrcEf04hyD/iKSLm6ocvY+Zy
	MFaT4IUQ==;
Received: from localhost ([::1]:41930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXBNQ-003JX7-BY; Fri, 08 May 2020 22:21:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXBNF-003JX0-UW
 for samba-technical@lists.samba.org; Fri, 08 May 2020 22:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=GZpyhKWxXL7BGCCB55qiO8Fy28rPbx0JmMMavsFngg0=; b=KTDqR9HJ7gcog7tXygxPsSwV2r
 acw/1Mk7+w9OIzx3Y9AwytU0OyBx9UR4TmrM1tpdm9XXgu+K3zGflWo6kKd/Oirn0dMOZLogxGYKf
 w9fAHEmj9Ey+dqZn+90M3fVNNOHFQGy/Hjjp4bqnNk/1TmsrjJw8VYkbC+JKZXf+4NmioewitSjIG
 bvEcxSsJoxuyaGY44ooPOUWekpuBiSvDlCUQ3Z2qudPCY3eJ/WVU9gBG8DN2ouce3DBf2KjP+ziVI
 XqRib5tqrsN8T+vLiMAD5qPX1Wc8VuQdMrBRSVPVBCrgrsUUxwY4yDh73BZQF0803bJkdm1Cz+23n
 Mc3cNd41SX2xg2FFHBAT1IwgGgev9O0rQPjzLjUO8ynmfjuIQDcnloNZobfvgKHMhzLuHRX1uiTP6
 fKHHYYnctJxX9Ys52oKjoLOcbYggi/1Su2P7x7wBeCKTUo1uY6j92UDDgg4euiO2g75mcVmBBI5uI
 jWtYkgcBUGU3A6zV6t8cG5QF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXBND-0001KI-Ji; Fri, 08 May 2020 22:21:39 +0000
To: Jeremy Allison <jra@samba.org>
References: <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer> <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer> <20200508220306.GC2912@jeremy-acer>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <46b84d03-2e86-c6f8-3e17-70dae620f7cd@samba.org>
Date: Sat, 9 May 2020 00:21:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508220306.GC2912@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="w7WYoGcsFEN5gBMgnlT8uGlYNWqwdiZ08"
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w7WYoGcsFEN5gBMgnlT8uGlYNWqwdiZ08
Content-Type: multipart/mixed; boundary="rtIe3c1tLCX3lggEhSz9vl4PfUstuQhQF";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <46b84d03-2e86-c6f8-3e17-70dae620f7cd@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer> <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer> <20200508220306.GC2912@jeremy-acer>
In-Reply-To: <20200508220306.GC2912@jeremy-acer>

--rtIe3c1tLCX3lggEhSz9vl4PfUstuQhQF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 09.05.20 um 00:03 schrieb Jeremy Allison:
> On Fri, May 08, 2020 at 02:50:55PM -0700, Jeremy Allison wrote:
>> On Fri, May 08, 2020 at 11:40:30PM +0200, Stefan Metzmacher wrote:
>>> Am 08.05.20 um 22:51 schrieb Jeremy Allison:
>>>> On Fri, May 08, 2020 at 01:47:09PM -0700, Jeremy Allison via samba-t=
echnical wrote:
>>>>> On Fri, May 08, 2020 at 09:35:31PM +0200, Stefan Metzmacher via sam=
ba-technical wrote:
>>>>>>
>>>>>> Thanks very much Jeremy! I didn't noticed that.
>>>>>>
>>>>>> I guess the attached patch should be able to fix the recursion.
>>>>>
>>>>> Oh Metze that's *really* ugly :-). I thought about
>>>>> doing that in my code and decided it was in too bad
>>>>> taste to live :-).
>>>>>
>>>>> Is there a cleaner way than putting "busy" and "retry"
>>>>> variables in the config struct ?
>>>>
>>>> And a "Goto again" as well :-(. Bleegh.
>>>
>>> This version would actually work and looks a bit similar to
>>> your version.
>>>
>>> Can you life with that version?
>>
>> Yes I can live with that :-). It at least moves the horror
>> to the wrapper function where you can at least concentrate
>> all your attention as to why it's doing what it's doing :-).
>>
>> RB+ from me if you add a comment header above the function
>> as well as in the commit so it explains what it's doing.
>>
>> Feel free to crib my ascii art to explain in the header
>> comment too :-).
>=20
> There's just one final comment I want to make before
> my version goes quietly into that good night... :-).
>=20
> I will grant that your version leaves a cleaner set of code
> paths throughout the io_uring pread/pwrite code and deals with
> the short read/write issues in a more "natural" way
> without my extra logic branches dealing with "short read"
> return etc.
>=20
> But the fact that you missed the recursion might make
> you consider if indeed it's a simpler fix than having
> all the extra logic made explicit. Sometimes explicit
> is good to draw people's attention to complexity.
>=20
> Having said that, I'll go with whatever you decide
> on this one :-). I already gave me RB+ for the fix,
> so I'll support whichever one you pick. But it would
> be good to get the fix pushed and back-ported into
> 4.12 asap to cover the data corruption.

I think we need to check the write case.

Do you know what happens when the kernel gets a negative offset?

Is there a way to do an O_APPEND?
Doing an fstat to get EOF is racy.
As well as split one write into multiple calls.

But maybe it's ok as a start.

Once we're done I'll ask Karolin to create a new 4.12 release.

> Thanks for working on this with me. I do learn things
> from the elegance of your code (usually :-).

Thanks for being so patient!
Your work was really useful in order to make it easier for
me to find my solution.

metze



--rtIe3c1tLCX3lggEhSz9vl4PfUstuQhQF--

--w7WYoGcsFEN5gBMgnlT8uGlYNWqwdiZ08
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6122wACgkQDbX1YShp
vVb0whAAnzO/0t9r8mlhgfNl67A3TeC1iNAqzNin6qbI7M+36Qha5kIzXVbfx4Gn
gsBOWqLEgFbNaoWlFjIOJ9i7/hURaG8bY85niRtXFPZrNBXPsbM3kytJWoFQphyo
S59C9FVBRNRO8S1sFzLaAB4wRMPQ0NFpiqSGdPxhba+cusG97S6yKw76owG2sExX
SKeXBE/cZtkOcjl2qiB41AGHY0kppw+4ELEqUEXyeu9NOj9Rjy9xFHrVruK6V2kj
QOFIRkCVKGBR5jFLZ8K+pct/lNzBl4hXh+7K88+4F4lFiVInaltdQI76oAiqB/d/
atZqZqkNDH3ArjbBvxvJttPSva+RUuGziY3EQNcQ586VlWwgnzJ1JJW/7zF42s/H
jDSZ7ohOgiX6Ixr9mG0snrli7WIQMYBtYzOAw74wjjmWkEOusm9xa54y6ZXT3z4E
WhRGfuktaRml9QjXBdo9s2ILu6jFUAwHlJKtZESuADupz0ySWReC8hTX9W7JdNgD
nAo2rTIf4sbPclevLKCtOSFikwRkQbgU/nATFuS5hAvKyLBivJi0kWScc0YeXM9S
n39DN8ZUCd8kjJLBbTvsUqh/17ZwXJzAG8tAknOH/j1Rm7c05JjHC6JYLa2Pwph8
39wBpvyBRNb7rddEXYc4clvszXU50bp8Q9/zcSvl2udPdpQOKjI=
=UecW
-----END PGP SIGNATURE-----

--w7WYoGcsFEN5gBMgnlT8uGlYNWqwdiZ08--

