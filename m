Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6758CB666
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2024 01:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=hQuyCgeBxLRpqJ6Rn/8rP8gQiImaeLze6sL+2DgtGrs=; b=iYEZxUlE8MAyBTYWd9DeIFw0D8
	Ms2ddb5JAqLd9u54wx3EB6t98n70wpQP7FOp+1UEsvyBoY1Bf8G58KsUZfhnTGkF1vXv/hhFUd5U6
	ekMuVM7cbY13upkQy9gWZpwIRM+lpGledW9kuErqdUEdb2yzAx3Z1InC2dJuuNXWNXCkfnYNCgOgQ
	ib/BkY3RD0U5xHBYClJ3ZNWBQO6GZJGuusBwLdT6zk+mBcQY2xoHWrczhLwbmg5GGWeibLp0qbeP7
	714QmdXQRQwoEuj72IyQ4oySzJ+pckwmc9jueHN44CfCU00z0yzG2oFlpKj1hi71iQIcxGmIljYSb
	NUqY8KNw==;
Received: from ip6-localhost ([::1]:62602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s9ZJ8-009Zul-Km; Tue, 21 May 2024 23:54:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36547) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9ZJ4-009Zue-4C
 for samba-technical@lists.samba.org; Tue, 21 May 2024 23:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716335646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hQuyCgeBxLRpqJ6Rn/8rP8gQiImaeLze6sL+2DgtGrs=;
 b=LrYnOEtmU9tJzaGwPxtUYvRptIfFHOOgPGviwmP2ZkukYJKl1D1hycsfuV7Q8gbQN4dNIg
 eOLpwsm7kg+H7+AhcvFPh6XPQuP9NdTNQqyNrGgrY5Sp4Vx7GLRXGci5KNWTCjU5BVt56O
 SGgW0ymgyU7u7PyduEgUsJ4LsYNxHbo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716335646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hQuyCgeBxLRpqJ6Rn/8rP8gQiImaeLze6sL+2DgtGrs=;
 b=LrYnOEtmU9tJzaGwPxtUYvRptIfFHOOgPGviwmP2ZkukYJKl1D1hycsfuV7Q8gbQN4dNIg
 eOLpwsm7kg+H7+AhcvFPh6XPQuP9NdTNQqyNrGgrY5Sp4Vx7GLRXGci5KNWTCjU5BVt56O
 SGgW0ymgyU7u7PyduEgUsJ4LsYNxHbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-DXwtdBVmPX-bXwj14l991A-1; Tue, 21 May 2024 19:54:02 -0400
X-MC-Unique: DXwtdBVmPX-bXwj14l991A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 415A680118E;
 Tue, 21 May 2024 23:54:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6669E492BC6;
 Tue, 21 May 2024 23:54:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
To: Steve French <sfrench@samba.org>, Jeremy Allison <jra@samba.org>,
 samba-technical@lists.samba.org
Subject: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 May 2024 00:53:59 +0100
Message-ID: <349671.1716335639@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
From: David Howells via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Howells <dhowells@redhat.com>
Cc: dhowells@redhat.com, linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


I've been debugging a failure in xfstests generic/286 whereby llseek() retu=
rn
-EIO and am thinking that the bug is in Samba.  The test can be distilled t=
o:

	mount //my/share /mnt -ooptions
	truncate -s 100M /mnt/a
	for i in $(seq 0 5 100); do xfs_io -c "w ${i}M 1M" /mnt/a; done
	xfstests-dev/src/seek_copy_test /mnt/a /mnt/b

This creates a big sparse file, makes 21 1MiB extents at 5MiB intervals and
then tries to copy them one at a time, using SEEK_DATA/SEEK_HOLE to enumera=
te
each extent.

I can see the error in the protocol being returned from the server:

   16 2.353013398  192.168.6.2 =E2=86=92 192.168.6.1  SMB2 206 Ioctl Reques=
t FSCTL_QUERY_ALLOCATED_RANGES File: a
   17 2.353220936  192.168.6.1 =E2=86=92 192.168.6.2  SMB2 143 Ioctl Respon=
se, Error: STATUS_BUFFER_TOO_SMALL

Stracing Samba shows:

    lseek(30, 94371840, SEEK_HOLE)          =3D 95420416
    lseek(30, 95420416, SEEK_DATA)          =3D 99614720
    lseek(30, 99614720, SEEK_HOLE)          =3D 100663296
    lseek(30, 100663296, SEEK_DATA)         =3D 104857600
    lseek(30, 104857600, SEEK_HOLE)         =3D 105906176
    sendmsg(35, {msg_name=3DNULL, msg_namelen=3D0, msg_iov=3D[{iov_base=3D"=
\0\0\0I", iov_len=3D4}, {iov_base=3DNULL, iov_len=3D0}, {iov_base=3D"\376SM=
B@\0\1\0#\0\0\300\v\0\n\0\1\0\0\0\0\0\0\0\265\2\0\0\0\0\0\0"..., iov_len=3D=
64}, {iov_base=3D"\t\0\0\0\0\0\0\0", iov_len=3D8}, {iov_base=3D"\0", iov_le=
n=3D1}], msg_iovlen=3D5, msg_controllen=3D0, msg_flags=3D0}, MSG_DONTWAIT|M=
SG_NOSIGNAL) =3D 77

You can see the error code in the sendmsg() as "...#\0\0\300...".

Turning debugging on on Samba shows:

    [2024/05/21 23:56:58.727547,  2] ../../source3/smbd/smb2_ioctl_filesys.=
c:707(fsctl_qar)
      QAR output len 336 exceeds max 16
    [2024/05/21 23:56:58.727652,  3] ../../source3/smbd/smb2_server.c:4031(=
smbd_smb2_request_error_ex)
      smbd_smb2_request_error_ex: smbd_smb2_request_error_ex: idx[1] status=
[NT_STATUS_BUFFER_TOO_SMALL] || at ../../source3/smbd/smb2_ioctl.c:353

The "exceeds max 16" indicates the "Max Ioctl Out Size" setting passed in t=
he
Ioctl Request frame (which can be seen as 16 in the full packet trace).  336
is 21 * 16.

This stems from the smb2_llseek() function in the cifs filesystem in the Li=
nux
kernel calling:

	rc =3D SMB2_ioctl(xid, tcon, cfile->fid.persistent_fid,
			cfile->fid.volatile_fid,
			FSCTL_QUERY_ALLOCATED_RANGES,
			(char *)&in_data, sizeof(in_data),
			sizeof(struct file_allocated_range_buffer),
			(char **)&out_data, &out_data_len);

where the max_out_data_len parameter is sizeof() you can see, allowing for
just a single element to be returned.  The file_allocated_range_buffer stru=
ct
is just:

	struct file_allocated_range_buffer {
		__le64	file_offset;
		__le64	length;
	} __packed;

which is 16 bytes - hence the maximum output data seen by Samba.


Now, cifs only wants the next extent.  It fills in the input data with the
base file position and the EOF:

	in_data.file_offset =3D cpu_to_le64(offset);
	in_data.length =3D cpu_to_le64(i_size_read(inode));

and asks the server to retrieve the first allocated extent within this rang=
e.

In Samba, however, fsctl_qar() does not pass in_max_output to
fsctl_qar_seek_fill() and therefore doesn't limit the amount returned.  The
fill loop seems only to be limited by the maximum file offset and not the m=
ax
buffer size.

The:

	if (out_output->length > in_max_output) {
		DEBUG(2, ("QAR output len %lu exceeds max %lu\n",
			  (unsigned long)out_output->length,
			  (unsigned long)in_max_output));
		data_blob_free(out_output);
		return NT_STATUS_BUFFER_TOO_SMALL;
	}

check at the end of fsctl_qar() generates the complaint.

I think that fsctl_qar() should probably just discard the excess records.

Looking at:

	https://learn.microsoft.com/en-us/windows/win32/api/winioctl/ni-winioctl-f=
sctl_query_allocated_ranges=20

it's not obvious what should be done if the available records won't fit.

Samba: samba-4.19.6-1.fc39.x86_64
Linux: 6.10 pre -rc1.

David


