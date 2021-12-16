Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C247800A
	for <lists+samba-technical@lfdr.de>; Thu, 16 Dec 2021 23:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=81Vv3nh8r/RaJZSOy1jxoqWeljKTaFBSysmjdaArh0k=; b=J3Wm0OFyHhtlIY61WC/aai/TIf
	hsYoNk0unNXOU1TRs6djO00q2uX/JWHJUx3S5CRTBEKYIId305MwqMBHfUMYi5Cb2whmAr6qhawcT
	EsRyjRuAe3qkY+JCWJUpDhJFVWIO2RHfJ1RAvZPGGJr3yIUku/JMrN6PjA7RhH9cK/LalhKosCzCH
	3MlQoAqoZlZNCZ2IHghSnoKtzmkYxXt3kEQ65SKflhyghP+5+gEQ6T+WakPHL/+Vv3m/UGkFGSyf0
	DYXTeybor6HzkMHAdH0+ZdaYOkSHrXI7qwLYJBD/O5h9uBI8yZOKSzNHcjl4WHpfRslZhETLv7nb9
	iUi8uOBw==;
Received: from ip6-localhost ([::1]:62410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mxzLt-000wuL-5g; Thu, 16 Dec 2021 22:35:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54574) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mxzLo-000wuC-0m
 for samba-technical@lists.samba.org; Thu, 16 Dec 2021 22:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=81Vv3nh8r/RaJZSOy1jxoqWeljKTaFBSysmjdaArh0k=; b=0Z1NStck/J4pwPMOoYkhttgTEJ
 5+phNvOlZ8ptmEVJsULiZwKNpVWqw91s4iSqalVffkNPUfbPMD7axx8CdXMri5FT39nCtd0KrOzdJ
 MYX59CLqHqVqTP9dkUCP7WvkK4qvwqChvBFVzSk0vIWP150esUuH27dumc4Cnj5UsLz1dMjMBXlhE
 akBgCBZwt3VdEmFCEyMHXi9S7i5MvD3fh4LWrzq0HJ8Bk3stAJNupio2sf2+m0HLuEzIi2nVndz3d
 4imVN+gdoCvU5/8FvhickIs8WNjsjiL3sr1rdzUqBhNszWoGQQHLNgxpCvA6DHJ1DGvf1iz7QsCvw
 lJpN4A4fjUrm+TIc+Rh6XLL+oqb8oipWWmpO9r2ASZI27X8l/WOdTBZxWLqZsZWJn/0SalIUrk+a9
 EiN9qdGVg/KKdkQ4tkQ0ojVpG9HSa06WRgi8KdOBLnqo8PIshwGvfphCfO6SfYOALUwfShkecKD81
 H3K9QQnm+Zfzso45KcrHAc/e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mxzLk-003Hvi-Eo; Thu, 16 Dec 2021 22:35:44 +0000
Date: Thu, 16 Dec 2021 14:35:41 -0800
To: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <Ybu/PSnO1XNqWUCh@jeremy-acer>
References: <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer> <YbOlvjkCcbp41r0e@samba.org>
 <a58df604-6341-5a18-377f-8ff204ab53da@talpey.com>
 <20211214224045.GB15579@fieldses.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211214224045.GB15579@fieldses.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Tom Talpey <tom@talpey.com>, Andrew Walker <awalker@ixsystems.com>,
 Christof Schmitt <cs@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 14, 2021 at 05:40:45PM -0500, J. Bruce Fields wrote:
>
>Even if you could: it's true that there's an i_generation in the generic
>struct inode, but I doubt there's any guarantee it meets your
>requirements (or is even initialized to anything at all) for a given
>filesystem.
>
>(Whereas if it were added to statx then the filesystem could choose to
>return it or not depending on whether it's supported.)

So to step back a bit, I think this only affects MacOSX clients.

I believe (Tom please correct me if I'm wrong) the Windows buffer
cache is based on pathname from the share root, not the reported fileid.

Also, I'm guessing that the buffer cache should not be preserved
over a connection loss. Or is it preserved if the client has a
persistent handle ?

So from the server side we have a 64-bit number we need to keep
constant over the lifetime of a particular file, and at least
for MacOSX clients we can't re-use any number even if the file
is deleted and re-created over the lifetime of a connection.

I'm just trying to scope out the exact issue we're trying
to solve.

Currently in Samba, we have a 64-bit fileid, which
we return via the following call in the VFS.

uint64_t fileid = SMB_VFS_FS_FILE_ID(conn, &stat_struct);

The default is:

vfswrap_fs_file_id(), which looks like:

static uint64_t vfswrap_fs_file_id(struct vfs_handle_struct *handle,
                                    const SMB_STRUCT_STAT *psbuf)
{
        uint64_t file_id;

         if (!(psbuf->st_ex_iflags & ST_EX_IFLAG_CALCULATED_FILE_ID)) {
                 return psbuf->st_ex_file_id;
         }

         if (handle->conn->base_share_dev == psbuf->st_ex_dev) {
                 return (uint64_t)psbuf->st_ex_ino;
         }

         /* FileIDLow */
         file_id = ((psbuf->st_ex_ino) & UINT32_MAX);

         /* FileIDHigh */
         file_id |= ((uint64_t)((psbuf->st_ex_dev) & UINT32_MAX)) << 32;

         return file_id;
}

By default, when reading the stat info from a file,
st_ex_file_id is set directly from the inode number.

         st_ex_file_id = ex_ino;
         st_ex_iflags |= ST_EX_IFLAG_CALCULATED_FILE_ID;

and the flag ST_EX_IFLAG_CALCULATED_FILE_ID is set to
show this is a 'calculated from inode' fileid.

When smbd itself creates a file or directory, it calls:

                         file_id = make_file_id_from_itime(&smb_dname->st);
                         update_stat_ex_file_id(&smb_dname->st, file_id);

where make_file_id_from_itime() returns the immutable "birth time"
as the fileid, and update_stat_ex_file_id() does:

         st_ex_file_id = file_id;
         st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_FILE_ID;

so it clears the ST_EX_IFLAG_CALCULATED_FILE_ID flag,
meaning that vfswrap_fs_file_id() will directly return
st_ex_file_id (i.e. the immutable "birth time") as
the fileid.

These two calls (make_file_id_from_itime()/update_stat_ex_file_id())
are also done when smbd reads an extended attribute containing
a stored DOS attribute with the XATTR_DOSINFO_ITIME flag set,
meaning we always return the same fileid for a file with
a given birthtime.

This fixes the problem for MacOSX clients (in that
birthtime is always increasing as the arrow of time
marches on) but then fails for the case where the
birthtime timestamp resolution is so poor that two
files can end up with the same birthtime.

I'm thinking a tweak in the make_file_id_from_itime()
case must be the eventual fix here.

Still considering the right way to go about this...

