Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203C3BD753
	for <lists+samba-technical@lfdr.de>; Tue,  6 Jul 2021 15:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=oGx/Zupu/fAxll5i4vd8Y7bQ+QSE8l5gg8QBVKrCe6U=; b=jpJYQRoNQdjmJEDbPM4V6Z2ilh
	MH22VBywZ1Y/K9cY+JCyHDhAHKulme56B0BoqPtjApOfGiAnaO5fXPkLJ2pO5Nqq98GX21afa3e7P
	yBbOF0Y20r/cuzJ96kR2+wMCGkrGE9an1ymDzBLbcBqX5SJ8yIWyT8707LG2/oag/4HfFdtSf0eYi
	uiraPk87eoe0HxUC7dT2jKaUDWl9BPV2xh2GKoeOrYkuaSdU8Oe2EGDAiZiP30iCOuK9kZAqqSAFn
	xk5lGmh1zFFmN8C3OO1YlYMC/ErrrGUK5QX8X43SqeqnIinUguV1YPCieB4rSDwrHGU+pOl44Zdun
	pAWnJQAA==;
Received: from ip6-localhost ([::1]:58456 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m0kfh-00CV4l-Nt; Tue, 06 Jul 2021 12:59:29 +0000
Received: from phd-imap.ethz.ch ([129.132.80.51]:60928) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0kfc-00CV4b-6v
 for samba-technical@lists.samba.org; Tue, 06 Jul 2021 12:59:26 +0000
Received: from localhost (ict-networks-192-168-127-049.fwd-v4.ethz.ch
 [192.168.127.49])
 by phd-imap.ethz.ch (Postfix) with ESMTP id 4GK2gZ2MJlz3K
 for <samba-technical@lists.samba.org>; Tue,  6 Jul 2021 14:59:06 +0200 (CEST)
Received: from phd-mxin.ethz.ch ([192.168.127.53])
 by localhost (phd-mailscan.ethz.ch [192.168.127.49]) (amavisd-new, port 10024)
 with LMTP id dJfd3vcXX42p for <samba-technical@lists.samba.org>;
 Tue,  6 Jul 2021 14:59:06 +0200 (CEST)
Received: from webmail.phys.ethz.ch
 (ict-networks-192-168-127-051.fwd-v4.ethz.ch [192.168.127.51])
 by phd-mxin.ethz.ch (Postfix) with ESMTP id 4GK2gZ18dpz29
 for <samba-technical@lists.samba.org>; Tue,  6 Jul 2021 14:59:06 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 06 Jul 2021 14:59:06 +0200
To: samba-technical@lists.samba.org
Subject: State of vfs_nfs4acl_xattr.
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <afc32b57e57c35e4d49a2b3904f8d80f@phys.ethz.ch>
X-Sender: mbonin@phys.ethz.ch
Organization: ISG D-Phys
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
From: Maciej Bonin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Maciej Bonin <mbonin@phys.ethz.ch>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear Samba developers,

I've recently tried to get vfs_nfs4acl_xattr to work for re-exporting of 
an nfs4 mount from a linux server.
As far as I can tell, this is simply not possible at the moment. Am I 
correct in that belief ?

I've adjusted all the default parameters to make it somewhat funtional, 
to the values below:

==CUT
    nfs4acl_xattr:encoding = nfs
    nfs4acl_xattr:nfs4_id_numeric = yes
    nfs4acl_xattr:xattr_name = system.nfs4_acl
    nfs4acl_xattr:validate_mode = no
    nfs4acl_xattr:default acl style = posix
    nfs4acl_xattr:version = 40
==CUT

However, this seems to work only on directory ACLs, and, for files, 
neither the NFS4 ACLS, nor the "default" doubly-synthetic acls generated 
from standard POSIX permissions, work at all.
For an end user, this seems like you can create and write files, but 
never edit or even read/download them again.
Everything I've tried leads to NT_STATUS_ACCESS_DENIED. The sd struct in 
debug logs seems to look ok, even when the access fails, but I'm not 
that familiar with NT ACLs to be able to fully verify that. And most 
certainly not familiar enough with samba internals and source to 
understand why the checks (presumably performed against samba's 
internalt NT/nfs4 acl representation created even when not using the vfs 
module) fail. Please see the below output:

==CUT
[2021/07/05 11:36:11.156400, 10, pid=730056, effective(13117, 2320), 
real(13117, 0)] ../../source3/smbd/open.c:210(smbd_check_access_rights)
   smbd_check_access_rights: acl for testfile.img is:
[2021/07/05 11:36:11.156413,  1, pid=730056, effective(13117, 2320), 
real(13117, 0), class=rpc_parse] 
../../librpc/ndr/ndr.c:429(ndr_print_debug)
        sd: struct security_descriptor
           revision                 : SECURITY_DESCRIPTOR_REVISION_1 (1)
           type                     : 0x8004 (32772)
                  0: SEC_DESC_OWNER_DEFAULTED
                  0: SEC_DESC_GROUP_DEFAULTED
                  1: SEC_DESC_DACL_PRESENT
                  0: SEC_DESC_DACL_DEFAULTED
                  0: SEC_DESC_SACL_PRESENT
                  0: SEC_DESC_SACL_DEFAULTED
                  0: SEC_DESC_DACL_TRUSTED
                  0: SEC_DESC_SERVER_SECURITY
                  0: SEC_DESC_DACL_AUTO_INHERIT_REQ
                  0: SEC_DESC_SACL_AUTO_INHERIT_REQ
                  0: SEC_DESC_DACL_AUTO_INHERITED
                  0: SEC_DESC_SACL_AUTO_INHERITED
                  0: SEC_DESC_DACL_PROTECTED
                  0: SEC_DESC_SACL_PROTECTED
                  0: SEC_DESC_RM_CONTROL_VALID
                  1: SEC_DESC_SELF_RELATIVE
           owner_sid                : *
               owner_sid                : S-1-22-1-13117
           group_sid                : *
               group_sid                : S-1-22-2-2320
           sacl                     : NULL
           dacl                     : *
               dacl: struct security_acl
                   revision                 : SECURITY_ACL_REVISION_NT4 
(2)
                   size                     : 0x004c (76)
                   num_aces                 : 0x00000003 (3)
                   aces: ARRAY(3)
                       aces: struct security_ace
                           type                     : 
SEC_ACE_TYPE_ACCESS_ALLOWED (0)
                           flags                    : 0x00 (0)
                                  0: SEC_ACE_FLAG_OBJECT_INHERIT
                                  0: SEC_ACE_FLAG_CONTAINER_INHERIT
                                  0: SEC_ACE_FLAG_NO_PROPAGATE_INHERIT
                                  0: SEC_ACE_FLAG_INHERIT_ONLY
                                  0: SEC_ACE_FLAG_INHERITED_ACE
                               0x00: SEC_ACE_FLAG_VALID_INHERIT (0)
                                  0: SEC_ACE_FLAG_SUCCESSFUL_ACCESS
                                  0: SEC_ACE_FLAG_FAILED_ACCESS
                           size                     : 0x0018 (24)
                           access_mask              : 0x00160187 
(1442183)
                           object                   : union 
security_ace_object_ctr(case 0)
                           trustee                  : S-1-22-1-13117
                       aces: struct security_ace
                           type                     : 
SEC_ACE_TYPE_ACCESS_ALLOWED (0)
                           flags                    : 0x00 (0)
                                  0: SEC_ACE_FLAG_OBJECT_INHERIT
                                  0: SEC_ACE_FLAG_CONTAINER_INHERIT
                                  0: SEC_ACE_FLAG_NO_PROPAGATE_INHERIT
                                  0: SEC_ACE_FLAG_INHERIT_ONLY
                                  0: SEC_ACE_FLAG_INHERITED_ACE
                               0x00: SEC_ACE_FLAG_VALID_INHERIT (0)
                                  0: SEC_ACE_FLAG_SUCCESSFUL_ACCESS
                                  0: SEC_ACE_FLAG_FAILED_ACCESS
                           size                     : 0x0018 (24)
                           access_mask              : 0x00120081 
(1179777)
                           object                   : union 
security_ace_object_ctr(case 0)
                           trustee                  : S-1-22-2-2320
                       aces: struct security_ace
                           type                     : 
SEC_ACE_TYPE_ACCESS_ALLOWED (0)
                           flags                    : 0x00 (0)
                                  0: SEC_ACE_FLAG_OBJECT_INHERIT
                                  0: SEC_ACE_FLAG_CONTAINER_INHERIT
                                  0: SEC_ACE_FLAG_NO_PROPAGATE_INHERIT
                                  0: SEC_ACE_FLAG_INHERIT_ONLY
                                  0: SEC_ACE_FLAG_INHERITED_ACE
                               0x00: SEC_ACE_FLAG_VALID_INHERIT (0)
                                  0: SEC_ACE_FLAG_SUCCESSFUL_ACCESS
                                  0: SEC_ACE_FLAG_FAILED_ACCESS
                           size                     : 0x0014 (20)
                           access_mask              : 0x00120081 
(1179777)
                           object                   : union 
security_ace_object_ctr(case 0)
                           trustee                  : S-1-1-0
[2021/07/05 11:36:11.156781, 10, pid=730056, effective(13117, 2320), 
real(13117, 0)] ../../source3/smbd/open.c:1320(open_file)
   open_file: smbd_check_access_rights on file testfile.img returned 
NT_STATUS_ACCESS_DENIED
==CUT

This file has the following nfs4 xattr permissions:

==CUT
nfs4_getfacl /home/isg/testfile.img
A::OWNER@:rwatTcCy
A::GROUP@:rtcy
A::EVERYONE@:rtcy
==CUT

and the following POSIX permissions directly in the filesystem:

==CUT
getfacl /export/censored/isg/testfile.img
getfacl: Removing leading '/' from absolute path names
# file: export/censored/isg/testfile.img
# owner: username_for_uid_13117
# group: name_for_gid_2320
user::rw-
group::r--
other::r--
==CUT

Please note that the failure occurs in very much the same way whether 
the file actually has extended ACLs set or not.

While I don't expect this to work at the moment, and have reverted to 
re-exporting nfs mounts purely using nfs3 and letting it follow POSIX 
extended ACLs, my question is: Will vfs_nfs4acl_xattr ever be in a state 
where it's possible to use the synthetic xattr from nfs4 mounts and 
respect (or even edit/set) the extended ACLs, or is this rather very low 
priority for you ?
Additionally, could you explain what the original rationale for the vfs 
module was at all ? I don't understand which implementation the options 
described in the manual page (and, even more confusingly, the defaults) 
are supposed to support. A native NTFS+ filesystem exported from a 
POSIX-compliant host ? There seems to be another module for zfs, which 
has yet another incompatible implementation available natively, but that 
doesn't seem to be related to vfs_nfs4acl_xattr.

Kind regards

-- 

Maciej Bonin <mbonin@phys.ethz.ch>            support:
IT Services Group, HPT H 8                    voice:
Department of Physics, ETH Zurich
CH-8093 Zurich, Switzerland                   http://nic.phys.ethz.ch/

