Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8588CBD53
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2024 10:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xKVeC/krV9L90AQYj8hvzOrI0sUjjpS4t6WVFU97iGE=; b=To8sMmFHnbyIMbn00d4y96W9vM
	kTUQqdquME3LaW0hh194vs81MF1HpjleT8dVAClNU3NiHYaiDNzCrnBgrdrCok8mTjgEn/g6RhZ2T
	V+VxQU8s6uWSQ2TrYv9JAxXDHgmRU6kJ2IOgd3q7dbt119dKBKd+HHQoohzbtXbAPofEnILtLO+y6
	1EnkRtA2vJY53WhnYf1Fa0DOM4W9NGFwtNgas5dkWqxdgi2kVlEW3Cg2WLM2nRGONy+NPINzGqJmp
	QncbBREFVWw2hjdbA+sDTl7688B7rJ8JUAzQykDGrifpsBSpojaSjdFqQCLSq1rN1IybOZfPklk/p
	fCa8ilOA==;
Received: from ip6-localhost ([::1]:61636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s9hiz-009bEI-3H; Wed, 22 May 2024 08:53:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46176) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s9hiu-009bEB-CP
 for samba-technical@lists.samba.org; Wed, 22 May 2024 08:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=xKVeC/krV9L90AQYj8hvzOrI0sUjjpS4t6WVFU97iGE=; b=RF70OgsUgew3UOkCOVcqeaHN0E
 aJlc100JSjjCfvKnKH1NYlhz2qfiU1q2+gcpOMvFIFq1874NMnrwRBOA7UPP9usw6/di50P2GxSMi
 LZvXm1mjxu1SQxYdsSXq7nBMEkSbz2FPti0DBtKdsqmPlEWa68QEcATcZIv+n8MCBcb+JHTEgKJG1
 P3/g+SL42BqEfMzBc5CSd4s3vIOU6LNsVoH397HtBJQlY0iyQYFetz5V4mzKxHiClaH2466MJ/liW
 84wj0o18JIjn6yC0lijzUsXlafHoy670VkRaevu4nHDe0wxsmOEbpZPWMw0Mp2k7zaaO11FnAaeex
 ae80BMM2Tv9TP0hcH8b70+nu6AfNmBw7q8z4udkAPeJJdrMj7JBOp6c2fdk6XQ/esZ2bHrfaLkCg3
 h0z79MW+bAzYdRX6dzsP5KPC/VJOP+7qp0Qx4r2nXyg+IE1YJpyrK32Fr8hVTkrGtD7kyC442lFUD
 GIyU9/DXL8B/VViQqxlXVrSF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s9hip-00CZZ9-2L; Wed, 22 May 2024 08:53:20 +0000
Date: Wed, 22 May 2024 18:53:05 +1000
To: David Howells via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
Message-ID: <20240522185305.69e04dab@echidna>
In-Reply-To: <349671.1716335639@warthog.procyon.org.uk>
References: <349671.1716335639@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: David Howells <dhowells@redhat.com>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.com>, Jeremy Allison <jra@samba.org>,
 linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,

On Wed, 22 May 2024 00:53:59 +0100, David Howells via samba-technical wrote:

> I've been debugging a failure in xfstests generic/286 whereby llseek() re=
turn
> -EIO and am thinking that the bug is in Samba.  The test can be distilled=
 to:
>=20
> 	mount //my/share /mnt -ooptions
> 	truncate -s 100M /mnt/a
> 	for i in $(seq 0 5 100); do xfs_io -c "w ${i}M 1M" /mnt/a; done
> 	xfstests-dev/src/seek_copy_test /mnt/a /mnt/b

Thanks for providing the reproducer and detailed analysis...

> This creates a big sparse file, makes 21 1MiB extents at 5MiB intervals a=
nd
> then tries to copy them one at a time, using SEEK_DATA/SEEK_HOLE to enume=
rate
> each extent.
>=20
> I can see the error in the protocol being returned from the server:
>=20
>    16 2.353013398  192.168.6.2 =E2=86=92 192.168.6.1  SMB2 206 Ioctl Requ=
est FSCTL_QUERY_ALLOCATED_RANGES File: a
>    17 2.353220936  192.168.6.1 =E2=86=92 192.168.6.2  SMB2 143 Ioctl Resp=
onse, Error: STATUS_BUFFER_TOO_SMALL
>=20
> Stracing Samba shows:
>=20
>     lseek(30, 94371840, SEEK_HOLE)          =3D 95420416
>     lseek(30, 95420416, SEEK_DATA)          =3D 99614720
>     lseek(30, 99614720, SEEK_HOLE)          =3D 100663296
>     lseek(30, 100663296, SEEK_DATA)         =3D 104857600
>     lseek(30, 104857600, SEEK_HOLE)         =3D 105906176
>     sendmsg(35, {msg_name=3DNULL, msg_namelen=3D0, msg_iov=3D[{iov_base=
=3D"\0\0\0I", iov_len=3D4}, {iov_base=3DNULL, iov_len=3D0}, {iov_base=3D"\3=
76SMB@\0\1\0#\0\0\300\v\0\n\0\1\0\0\0\0\0\0\0\265\2\0\0\0\0\0\0"..., iov_le=
n=3D64}, {iov_base=3D"\t\0\0\0\0\0\0\0", iov_len=3D8}, {iov_base=3D"\0", io=
v_len=3D1}], msg_iovlen=3D5, msg_controllen=3D0, msg_flags=3D0}, MSG_DONTWA=
IT|MSG_NOSIGNAL) =3D 77
>=20
> You can see the error code in the sendmsg() as "...#\0\0\300...".
>=20
> Turning debugging on on Samba shows:
>=20
>     [2024/05/21 23:56:58.727547,  2] ../../source3/smbd/smb2_ioctl_filesy=
s.c:707(fsctl_qar)
>       QAR output len 336 exceeds max 16
>     [2024/05/21 23:56:58.727652,  3] ../../source3/smbd/smb2_server.c:403=
1(smbd_smb2_request_error_ex)
>       smbd_smb2_request_error_ex: smbd_smb2_request_error_ex: idx[1] stat=
us[NT_STATUS_BUFFER_TOO_SMALL] || at ../../source3/smbd/smb2_ioctl.c:353
>=20
> The "exceeds max 16" indicates the "Max Ioctl Out Size" setting passed in=
 the
> Ioctl Request frame (which can be seen as 16 in the full packet trace).  =
336
> is 21 * 16.
>=20
> This stems from the smb2_llseek() function in the cifs filesystem in the =
Linux
> kernel calling:
>=20
> 	rc =3D SMB2_ioctl(xid, tcon, cfile->fid.persistent_fid,
> 			cfile->fid.volatile_fid,
> 			FSCTL_QUERY_ALLOCATED_RANGES,
> 			(char *)&in_data, sizeof(in_data),
> 			sizeof(struct file_allocated_range_buffer),
> 			(char **)&out_data, &out_data_len);
>=20
> where the max_out_data_len parameter is sizeof() you can see, allowing for
> just a single element to be returned.  The file_allocated_range_buffer st=
ruct
> is just:
>=20
> 	struct file_allocated_range_buffer {
> 		__le64	file_offset;
> 		__le64	length;
> 	} __packed;
>=20
> which is 16 bytes - hence the maximum output data seen by Samba.
>=20
>=20
> Now, cifs only wants the next extent.  It fills in the input data with the
> base file position and the EOF:
>=20
> 	in_data.file_offset =3D cpu_to_le64(offset);
> 	in_data.length =3D cpu_to_le64(i_size_read(inode));
>=20
> and asks the server to retrieve the first allocated extent within this ra=
nge.
>=20
> In Samba, however, fsctl_qar() does not pass in_max_output to
> fsctl_qar_seek_fill() and therefore doesn't limit the amount returned.  T=
he
> fill loop seems only to be limited by the maximum file offset and not the=
 max
> buffer size.
>=20
> The:
>=20
> 	if (out_output->length > in_max_output) {
> 		DEBUG(2, ("QAR output len %lu exceeds max %lu\n",
> 			  (unsigned long)out_output->length,
> 			  (unsigned long)in_max_output));
> 		data_blob_free(out_output);
> 		return NT_STATUS_BUFFER_TOO_SMALL;
> 	}
>=20
> check at the end of fsctl_qar() generates the complaint.
>=20
> I think that fsctl_qar() should probably just discard the excess records.
>=20
> Looking at:
>=20
> 	https://learn.microsoft.com/en-us/windows/win32/api/winioctl/ni-winioctl=
-fsctl_query_allocated_ranges=20
>=20
> it's not obvious what should be done if the available records won't fit.

MS-FSCC from https://winprotocoldoc.blob.core.windows.net/productionwindows=
archives/MS-FSCC/%5bMS-FSCC%5d.pdf
is a more protocol-specific reference here, but it's still unclear
regarding partial / truncated responses.

We do have an existing test for the STATUS_BUFFER_TOO_SMALL response in
test_ioctl_sparse_qar_malformed(), which would have been run against a
Windows server to confirm matching protocol behaviour. But it doesn't
cover partial responses.

I think the best way to proceed here would be to capture traffic for the
same workload against a Windows SMB server. This could be don't by using
your cifs.ko workload or extending test_ioctl_sparse_qar_malformed().

Cheers, David

