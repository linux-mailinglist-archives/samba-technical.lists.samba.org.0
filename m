Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A04207E48
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jun 2020 23:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=0ytnsl/1mwPX7QYcbwVkIwd8RFsbbfje2lv6f5kS3sA=; b=KaEv3L8TCTBbt8iVMISzQtojvr
	fjmGHAF1tRivVl6d25TngtFqzBAjFFqy+7rk+6rFlIJz9DOoz+WCQXVU5kuf1zL8VvvKJu2ht0JMH
	PUcGK05t66aEa+yv5QvH0pKIpMoLFZ0ZVnVMQ7P0YgxkwTzOd39nmoIRlny+hGjz35PLJLIRfp1Yy
	SXT4PLfzGFjuBqwOnoRBybANgkwBcT32rUpth3Lj8z2l8tp7iJ5wILeSrNfdlaN3uAkHRZ1tGa9bQ
	r3dcPkAHTLqJm0uDMRUnPOEP/qWer5MwjMY/LLN8UvbPfITVehEA3jp3y5otEo6fyYk7UCLwfEzN5
	dpeOzp5A==;
Received: from localhost ([::1]:51564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1joCjM-002CWI-Lk; Wed, 24 Jun 2020 21:14:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58956) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joCjF-002CWB-Tw
 for samba-technical@lists.samba.org; Wed, 24 Jun 2020 21:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:From:To;
 bh=0ytnsl/1mwPX7QYcbwVkIwd8RFsbbfje2lv6f5kS3sA=; b=f5JccWz0sUujmnhukJo+1pZc6g
 hJWNImjvV+NQXT5uAGhYEU7jvp71pKeRmczQXYRm20htSTQCFUMnk/6ynYqUcWplPYcn3OtchdUw0
 /08BUXvi4ycIiL+mgZDIa5yXhG32tJQkmkX2tuzeJZIN6a4SH+bQHc4Hnv/+Xkj5NO08WIWTo9Y08
 r0T+LiXMqGX8VV+tpmwegI4OCRmTfKXOkUMQsO1/90wm7HPjVlP+1yJh20hL9Td3cwx/a04k7PPUD
 7dLtM9LpwSsm//9AEzrsKDrDRkgOiu2mFAVulIK+E8PXfqe64OsX3SKcXbQNufsGyQgXmT+fMwMKt
 lRTLPLQqa0+MhDVzcETXdjDJ/tjOzMAmtddBHNm19qMgh96JNt0Dj2Dbql9L0uwMiRBiMs/a29dyd
 MoFB/Oc8sOdGegKgbjXTKjbUeblRVeVCsz3/Ugz28GIKv4G1trSKMgE5AtLCFgxzfBPLCVFus3E4/
 jUWD39jjSLDIKnIjsWLRbvIi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joCjF-0002zW-7g; Wed, 24 Jun 2020 21:14:45 +0000
To: Anoop C S <anoopcs@redhat.com>
Subject: socket-wrapper fd-passing
Message-ID: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
Date: Wed, 24 Jun 2020 23:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="W9Xv3rD43lbcJxThHK0ZfzCoQhM4Ojf0Z"
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
--W9Xv3rD43lbcJxThHK0ZfzCoQhM4Ojf0Z
Content-Type: multipart/mixed; boundary="DPqnEUBbk4BkJyIgffRjHLgFlwU2lL5RE";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@redhat.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
Subject: socket-wrapper fd-passing

--DPqnEUBbk4BkJyIgffRjHLgFlwU2lL5RE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Anoop,

I rebased your fd-passing patches on top of socket_wrapper master.

See https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing/

Please also notice my commit on top where I added some more hints
on a better design:

  - We need to maintain a small file using mmap and protected
    by pthread robust mutexes. E.g. one file per local ip address.
  - The path specified in SOCKET_WRAPPER_FD_PASSING_DB will
    be used as the file name, if this is not specified we'll
    use malloc'ed and fd-passing is not enabled.
  - The file contains a header (with magic, unique id, size and
free-list pointer)
    followed by an array of socket_info structures.
  - The socket_info_fd structures will only maintain the index
    into the mmap'ed array.
  - fd-passing is limited to fixed number (~ 127), this should be
    more than enough for typical caller (Samba would just use 1).
  - In order to do fd-passing of tcp/udp sockets, we'll create
    a pipe (or similar) where we write an array of with indexes
    into the mmap'ed array into the write end of the pipe.
    We would also pass the device/inode and a unique identifier
    for the file.
    The read end of the pipe is then passed as the last fd to
    the destination process. The destination process can rebuild
    the socket_info_fd structures by reading the array indexes.
    out of the read end of the pipe.
  - A tricky part will be the reference counting in the database
    entries. The sender needs to write the data into the pipe
    and increment the refcounts in the db file before calling
    sendmsg(). The sender may hold a mutex for each socket
    during sendmsg().
  - In order to allow multiple threads (or processes) to share a single
    socket we need to add mutex protection in quite a few places.
    In the most common cases there won't be any contention on the mutexes=
,
    but it will garantee correctness for the corner cases which happens
    for fd-passing.

An additional idea would be using temporary anonymous files (maybe
memfd_create() or an similation for it) for shared structures for passed
sockets. In sendmsg() the sender would move the socket_info[_container]
structures from malloc'ed memory to an temporary memory file.
This will replace the pipe fd of the original design.
If multiple fd's are passed, the memory file contains an array of
socket_info[_container] structures.
int *socket_fds_idx would be changed to an array of structures
or we have an additional array to store possible fd for the temporary
files and have the destructing code lock at it and select between
free() and munmap()/close().
This design would not require a named file, like the one specified
by SOCKET_WRAPPER_FD_PASSING_DB.

Do you have comments on these additions?

Thanks!
metze


--DPqnEUBbk4BkJyIgffRjHLgFlwU2lL5RE--

--W9Xv3rD43lbcJxThHK0ZfzCoQhM4Ojf0Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl7zwkAACgkQDbX1YShp
vVaaFg/8DtwR/p3Ha5ajdEr2Bdf88Lq73IOBs8sGH+HLJFbJJD0BQuSRuJqTvIff
GOTr5YS5gWZiaRq9tE70Q0hL2x1GwIj6bddwQBff8MhJWusNFJlOxxeSlRDwveCH
1dxcivQNhtjJkPAB/Yadd3MHyHJFVcS5Sf0Iwyjnpe4Y1VnHVIkeKCkInSQYMAI3
iPZDfTQQ5Qy7mbVpELLVpSpDwiaDaLIy1pueqyIK0tyosqE4p3bbGZH0zYsT7aOR
exp1nMn/Z8V3FeGVLzJ506yL5dDHq4Ue9+ej4lpLalXAJQNxuoOI4G6uKXEMVy2x
aWXCywThblRvLF2V7d/LbASAsBY+QjXXkVKkJPCLBEpG7Uu7ZAJ/jiXCT7BYcACe
dq58qMk9AGlCTyBWJpIcoseB3UsGT4A8872qA33ddrf6u/Vp69GDiEv1NwXC2vD2
+epTW76Ki0YWxfBjUW9U+wz9N9QdIoJWIVJWy+SNthg5Tdgjr0ng2Xe82Q7e8uPX
kS/YFIYOWPE3xOTmcF1rncorKpw/jZHC8MFpe+tEMrp3+xTDV7eoVs+gxSKAcxEk
WYnVyiEXa33HYAmzr6NFNI04GB7gcSYn4phtNXCP7DTxiPVMDWJmkPibxWsBiRIZ
bOuIx7e//ra7KNjpPFXYin/4DF5iOP2LRnCUbZQVbtD+4+RYcw8=
=39+1
-----END PGP SIGNATURE-----

--W9Xv3rD43lbcJxThHK0ZfzCoQhM4Ojf0Z--

