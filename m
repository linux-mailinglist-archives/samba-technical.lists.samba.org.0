Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF81CB85F
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 21:35:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=6XJoaVMPXKaeOtYEPLreLKZLnBH0B/f6nbMbp5cUYcI=; b=32izYf4TGueFxBbi/ITb1zn/Go
	6/gfd93jIV/1gw2cFTtMWLEhjkB+rVgRw0DbsdbKIXMqaFzjVZo6+7HV9a5aaPDDBB/27MoZ/IwzI
	zji84AakVtcRlu86DvAoDz1yesf1fJyIT08mPCi4vAjpd9PwKVyJdmSx51PQ9454/5vgA8qLqB8Ru
	TUS/9Q87Rpl8H9XqTCA0l7sdKgORAEr4CLoF2FGTzkwfZKjql6XMeeJOcg1LB8J+kOJZK4wvd80QV
	c7ke1GAViYtA3uVLup5dNdgpXwlDDpdP6xui7nNPZU+g/Ch4/X+29jAIDt/99H9lSS1aRJ6/u4vCN
	xsvKO6XA==;
Received: from localhost ([::1]:23340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX8mk-003Gjl-KF; Fri, 08 May 2020 19:35:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45528) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX8mX-003Gje-GZ
 for samba-technical@lists.samba.org; Fri, 08 May 2020 19:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=6XJoaVMPXKaeOtYEPLreLKZLnBH0B/f6nbMbp5cUYcI=; b=3IPMnEVBQE93etOESDN7TbytlK
 FKMBoaqeFwTpnm+bRIfoeEH/ICI20paYc+URqVMLfCd9l1H31JAa0EeQKjLtIKciBdyF04YZptUf7
 qBwrk/fvM11pbHvckhg+LOpYmDWcOl1HWYpe/ZLZu49fWdLOxB70CZIEkrV9YjJ5UbWekvcnLMEOW
 z+bqk/qAJhHPqbHWz5dJuMH8CTnuoQdEhUr/IMHm8CxVEuV89LYxD9z5RHNMAK4lcfUojOwMbUn3J
 AiA45AYHrXXCaSWfkmUgzMHlD1P+odxUWdrNAKT/FhhzPXgKJHAZV0tDg6NbSnaitaaSjk4NFV58t
 D+izIzkb56nm+Pr8pXZruyGjN7PjX7Fq5xjP5XGKyl4TcDOsb3g8/nOaPa3qCYeUg5LaZFYqDt7gA
 C1RrpwVjd7nY1FP1oCztL7Zc3r52nUn+3WzdTGfz4yHDYWK2PXcA5ApBr8nALx9+/+dMn0xRW//Sp
 29kYUWF6xyAG4X1CIfaGOSn1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX8mW-0008K6-4j; Fri, 08 May 2020 19:35:36 +0000
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Jeremy Allison <jra@samba.org>, Anoop C S <anoopcs@cryptolab.net>
References: <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer> <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
Message-ID: <8e7d4319-a919-a364-8337-29308926f509@samba.org>
Date: Fri, 8 May 2020 21:35:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508185339.GD26399@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="T3KbnCXjlI1AcWwoiwXHtEqxgn4HLXyKz"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T3KbnCXjlI1AcWwoiwXHtEqxgn4HLXyKz
Content-Type: multipart/mixed; boundary="9FJ7ERASR8S40vYjRxPnEud9cJUz1wwMV";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>, Anoop C S <anoopcs@cryptolab.net>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <8e7d4319-a919-a364-8337-29308926f509@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer> <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
In-Reply-To: <20200508185339.GD26399@jeremy-acer>

--9FJ7ERASR8S40vYjRxPnEud9cJUz1wwMV
Content-Type: multipart/mixed;
 boundary="------------A74BAAB82E1689B7B5983079"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A74BAAB82E1689B7B5983079
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 08.05.20 um 20:53 schrieb Jeremy Allison via samba-technical:
> On Fri, May 08, 2020 at 09:35:40PM +0530, Anoop C S wrote:
>>
>> Jeremy's patch(for handling short reads) still works with updated
>> kernel(v5.6.10).
>>
>>> Can you please also test the patch I posted here:
>>> https://bugzilla.samba.org/show_bug.cgi?id=3D14361#c21
>>
>> Unfortunately copy failed to start with this patch set. I don't know i=
f
>> its because of updated kernel(v5.6.8 -> v5.6.10) but smbd terminated
>> with SIGABRT right at the beginning of copy. I have attached backtrace=

>> and log file. Please have a look.
>=20
> I see the problem. It's the reason I initially introduced
> an immediate event, and then refactored my code to call
> _vfs_io_uring_queue_run() in a loop if it returned 'need_retry'.
>=20
> Metze's current code is recursive, and it's running out
> of stack.
>=20
> It uses:
>=20
> vfs_io_uring_pread_send()
> 	->vfs_io_uring_pread_submit()  <-----------------------------------
> 		->vfs_io_uring_request_submit()                           |
> 			->vfs_io_uring_queue_run()                        |
>                                                                        =
   |
> But inside vfs_io_uring_queue_run() once a read                        =
   |
> completes it calls:                                                    =
   |
>                                                                        =
   |
> vfs_io_uring_queue_run()                                               =
   |
> 	->vfs_io_uring_finish_req()                                       |
> 		->cur->completion_fn()                                    |
>                                                                        =
   |
> cur->completion_fn() for pread is set to vfs_io_uring_pread_completion(=
)  |
>                                                                        =
   |
> vfs_io_uring_pread_completion()                                        =
   |
> 	->vfs_io_uring_pread_submit() -------------------------------------
>=20
> (the ascii art will probably only work in fixed-font text mailers
> but you should get the idea).
>=20
> I don't think this pattern will work. You have to exit
> from vfs_io_uring_queue_run() all the way out so that
> you've called io_uring_cq_advance() to move the completion
> queue forward before you can submit another request to
> finish the short IO.

Thanks very much Jeremy! I didn't noticed that.

I guess the attached patch should be able to fix the recursion.

metze


--------------A74BAAB82E1689B7B5983079
Content-Type: text/plain; charset=UTF-8;
 name="tmp.diff.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="tmp.diff.txt"

RnJvbSBhMTgxOWY4YjAzY2E0M2M4NjBiZGZmN2IyYmRkZTc5Njc0ZmU3Y2M0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEu
b3JnPgpEYXRlOiBGcmksIDggTWF5IDIwMjAgMjE6Mjk6NTMgKzAyMDAKU3ViamVjdDogW1BB
VENIXSB2ZnNfaW9fdXJpbmc6IGF2b2lkIHN0YWNrIHJlY3Vyc2lvbiBvZgogdmZzX2lvX3Vy
aW5nX3F1ZXVlX3J1bigpCgpJbnN0ZWFkIHdlIHJlbWVtYmVyIGlmIHJlY3Vyc2lvbiB3YXMg
dHJpZ2dlcmVkIGFuZCBqdW1wIHRvCnRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24gYWdhaW4g
ZnJvbSB0aGUgZW5kLgoKQlVHOiBodHRwczovL2J1Z3ppbGxhLnNhbWJhLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MTQzNjEKClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBNZXR6bWFjaGVyIDxtZXR6
ZUBzYW1iYS5vcmc+Ci0tLQogc291cmNlMy9tb2R1bGVzL3Zmc19pb191cmluZy5jIHwgMjEg
KysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VyY2UzL21vZHVsZXMvdmZzX2lv
X3VyaW5nLmMgYi9zb3VyY2UzL21vZHVsZXMvdmZzX2lvX3VyaW5nLmMKaW5kZXggYTczMDhm
ZjllZGQzLi4xMzQwZDNhNWNhOWUgMTAwNjQ0Ci0tLSBhL3NvdXJjZTMvbW9kdWxlcy92ZnNf
aW9fdXJpbmcuYworKysgYi9zb3VyY2UzL21vZHVsZXMvdmZzX2lvX3VyaW5nLmMKQEAgLTM1
LDYgKzM1LDggQEAgc3RydWN0IHZmc19pb191cmluZ19yZXF1ZXN0Owogc3RydWN0IHZmc19p
b191cmluZ19jb25maWcgewogCXN0cnVjdCBpb191cmluZyB1cmluZzsKIAlzdHJ1Y3QgdGV2
ZW50X2ZkICpmZGU7CisJYm9vbCBidXN5OworCWJvb2wgbmVlZF9yZXRyeTsKIAlzdHJ1Y3Qg
dmZzX2lvX3VyaW5nX3JlcXVlc3QgKnF1ZXVlOwogCXN0cnVjdCB2ZnNfaW9fdXJpbmdfcmVx
dWVzdCAqcGVuZGluZzsKIAlib29sIG5vd2FpdF9wcmVhZDsKQEAgLTI1MywxMyArMjU1LDIy
IEBAIHN0YXRpYyB2b2lkIHZmc19pb191cmluZ19xdWV1ZV9ydW4oc3RydWN0IHZmc19pb191
cmluZ19jb25maWcgKmNvbmZpZykKIAlzdHJ1Y3QgdGltZXNwZWMgZW5kX3RpbWU7CiAJaW50
IHJldDsKIAotCVBST0ZJTEVfVElNRVNUQU1QKCZzdGFydF90aW1lKTsKLQogCWlmIChjb25m
aWctPnVyaW5nLnJpbmdfZmQgPT0gLTEpIHsKIAkJdmZzX2lvX3VyaW5nX2NvbmZpZ19kZXN0
cm95KGNvbmZpZywgLUVTVEFMRSwgX19sb2NhdGlvbl9fKTsKIAkJcmV0dXJuOwogCX0KIAor
CWlmIChjb25maWctPmJ1c3kpIHsKKwkJY29uZmlnLT5uZWVkX3JldHJ5ID0gdHJ1ZTsKKwkJ
cmV0dXJuOworCX0KKwljb25maWctPmJ1c3kgPSB0cnVlOworCitzdGFydF9hZ2FpbjoKKwlj
b25maWctPm5lZWRfcmV0cnkgPSBmYWxzZTsKKworCVBST0ZJTEVfVElNRVNUQU1QKCZzdGFy
dF90aW1lKTsKKwogCWZvciAoY3VyID0gY29uZmlnLT5xdWV1ZTsgY3VyICE9IE5VTEw7IGN1
ciA9IG5leHQpIHsKIAkJc3RydWN0IGlvX3VyaW5nX3NxZSAqc3FlID0gTlVMTDsKIAkJdm9p
ZCAqc3RhdGUgPSBfdGV2ZW50X3JlcV9kYXRhKGN1ci0+cmVxKTsKQEAgLTI5OSw2ICszMTAs
MTIgQEAgc3RhdGljIHZvaWQgdmZzX2lvX3VyaW5nX3F1ZXVlX3J1bihzdHJ1Y3QgdmZzX2lv
X3VyaW5nX2NvbmZpZyAqY29uZmlnKQogCX0KIAogCWlvX3VyaW5nX2NxX2FkdmFuY2UoJmNv
bmZpZy0+dXJpbmcsIG5yKTsKKworCWlmIChjb25maWctPm5lZWRfcmV0cnkpIHsKKwkJZ290
byBzdGFydF9hZ2FpbjsKKwl9CisKKwljb25maWctPmJ1c3kgPSBmYWxzZTsKIH0KIAogc3Rh
dGljIHZvaWQgdmZzX2lvX3VyaW5nX3JlcXVlc3Rfc3VibWl0KHN0cnVjdCB2ZnNfaW9fdXJp
bmdfcmVxdWVzdCAqY3VyKQotLSAKMi4xNy4xCgo=
--------------A74BAAB82E1689B7B5983079--

--9FJ7ERASR8S40vYjRxPnEud9cJUz1wwMV--

--T3KbnCXjlI1AcWwoiwXHtEqxgn4HLXyKz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl61tIQACgkQDbX1YShp
vVZrJQ//Y2g4JWDU7CgqQmkJZ5ZRAZnN6KXee9wtemNnCq0JfGbNbio9CHLGQv07
nt1YkRxDhdhpVKMJ92RfDqb1fiCIDn4Q6BA7Y/Rd5FHLliXM/gJ1rmu7WlYtU9rt
XbcQYzTCmjcgCOg3TngToq8+PswuTUTbVIaPdCW45RPh5Do+TNvmY170PrBsu1X/
wdhcgCUdEWK2INZyrhVQ32ZK8ryudZcIVct6oNxEiM8SHEmPVXhzdR2d6QSkUNhK
HpMR+Oh4SEp3Cpskc7AQwB/Wk8EVwlYnbtGl83UHPqGW6muGaVnxRpObvmDpFwsi
VdzueeR4yibn2hsAK4nN/docJ0et9t8GgmB8FXO4opmp/MT2FuvuyQ1LlEFvOmE0
nuZWwczsKFUwGL9XKGxUMxyaZ4ghOUMJZVuTCnl5PvfRdYb3SAzYx0XkQY42OzLi
eqIdOj7v/hKNInapoiouy8NhJlkml7cCldAmYBuRw1XOtwRsRG6oKO25nnDf3bZs
5WfIe3UUZ9guowWJ4mXs2B8pnK2AUKergAGtwjDdhvNWe+gHtyVB+zimMBXlCNEc
e+vx3/chPI1b6EeVwlYgd27weGhzmSI8+G3n/O3+z/w/4xsbRPCL8Gldr4mFK6mj
Ntx6Zis+vqvqhwpS4iZUnjSnIYKvw+Jk3o8T+jUHBslxG7qz4CI=
=XbZ+
-----END PGP SIGNATURE-----

--T3KbnCXjlI1AcWwoiwXHtEqxgn4HLXyKz--

