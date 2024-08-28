Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4BC9635A6
	for <lists+samba-technical@lfdr.de>; Thu, 29 Aug 2024 01:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0/J79pwOOpE1RxdcVntnkXRkew+KSLyEr8BlFLMAjRI=; b=Eut9lcqZJ/aw5LhpF3VEURcvgB
	UmRm9Ox8KQO+/yxlD24WEH1iFH0A3Jo8xX9OS21vVx3PFjOQ2BGiqKJi59XMuFGT4yABz5zUkPYRc
	01wLiknBLPpYOgJNf+jtqf6/AMXPGfgV53Pz16ZrC2VZAXbjughuSKCTJyfOcnDQ0MHKwZM6tTMXN
	bOy5j7leWiLjdunLd44CPfAtOk+fX1GWntqAtdTNDuIUzn3/IHZEq3oCS5H4Mx0xh4381lZtfK0wf
	MDD23e2nwDKNSab4hmVB+fIUgokY9prf27Bv+TRc3XNz2YJSUR/G9ChGdxjGSEaVU8iZTTBWbHZLo
	51uU+vNw==;
Received: from ip6-localhost ([::1]:46846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sjS9B-005kNH-LT; Wed, 28 Aug 2024 23:32:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21060) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sjS97-005kNA-Ea
 for samba-technical@lists.samba.org; Wed, 28 Aug 2024 23:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=0/J79pwOOpE1RxdcVntnkXRkew+KSLyEr8BlFLMAjRI=; b=UrgxXtC89LnQzVe0Q/e10xsZB4
 6wHSu4Mn5PL5E4MYaau/0Yi2gnjEDmDeqCKNAWk+UAWl0D4aKVIN+ZzlXqJAc4Xy7W32+gqzM4pBg
 umfTeWogYLtHo9sqRYx2SeB1yWogh2uwtIZrBy/mpWS9mojJYD7WdLFvqpDzmlLzWOaPqV9kfIvBm
 loxsm+J6vsOWeu8ld0My0ALrkT4rzPpo2zekDu+0XOi/yLFZACHW993RACwEiyQZsf921NaIy8Qaz
 qV71vofERn4b/HAsEKD1qp7CLXbf5H6CcFpgLv+BqUfqOuiW65N3rEcKD5XpNTh89skHiP2G2Hert
 eojbM2sFwWr07quhu011xToBANpc9kUk/eKa2sFRvIsl0b/MJ03VxyjHn4op7jniI6Sx6Zqr2t2aa
 Y6gl0zUTU93HWp3inn/h5Go9Ck35x3z51NjeoUiCkKyruT6JINAgEsAVZ5/W4b1iTREHrgA/DaGxt
 Ir5v98haLZeXPV5HX55Ey/+p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sjS95-008sKa-2h; Wed, 28 Aug 2024 23:32:12 +0000
Date: Wed, 28 Aug 2024 16:32:08 -0700
To: Orion <orion@et.byu.edu>
Subject: Re: become_root() Necessary for Group Quota in quotas.c?
Message-ID: <Zs-zeCrMwWn6xGdt@samba.org>
References: <65ad7c9a-38a3-4224-b40e-b7c991c8e0b2@et.byu.edu>
 <47bef7c7-50c7-4185-8268-89c0f5664703@et.byu.edu>
 <ZrqdmVERI9qENUBE@samba.org>
 <71f45191-4cc4-4d8c-ac8f-520c10739169@et.byu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71f45191-4cc4-4d8c-ac8f-520c10739169@et.byu.edu>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 26, 2024 at 03:40:18PM -0600, Orion via samba-technical wrote:
> On 8/12/24 17:41, Christof Schmitt via samba-technical wrote:
> > This sounds confusing. Why would the root not have access to the
> > directory?
> The server is making the request over NFS and root squashing is enabled on
> the machine which causes the permission issue.

This is at least unusual. I am not sure if that might also expose other
problems.

> I do not believe that it is necessary for the quota to be requested as root
> because this will allow any user to get the quota of any group whether or
> not they have permission to do so. For example, Linux quota-tools does not
> allow users to request quota for groups that they do not have access to.
> Instead it returns a permission denied error. FreeBSD (and presumably the
> other BSDs) also follow this pattern:
> 
> "Non-super-users can use the -g flag and optional group argument to view
> only the limits of groups of which they are members." -
> man.freebsd.org/cgi/man.cgi?query=quota
> 
> Since the systems should not make a call for a quota outside of which they
> have permissions, I believe we can move forward with just removing the
> become_root() and unbecome_root() parts.

What exactly failed for you? Did you query quotas, or did that happen
while creating a new file underneath a sgid directory?

The interesting codepath is when attempting to create a new file
underneath a sgid directory where the directory group has a quota
assigned, and the current user is not a member of this group.

With "strict allocate = yes" in the Samba config, then in
samba/source3/smbd/vfs.c
int vfs_allocate_file_space(files_struct *fsp, uint64_t len)

is called that first tries to allocate space for the file through
		ret = SMB_VFS_FALLOCATE(fsp, VFS_FALLOCATE_FL_KEEP_SIZE,
					0, len);

If that system call is not available in the underlying file system
(here, the NFS client, and specifically FL_KEEP_SIZE flag might not be
supported), then there is a fallback codepath to query the quota
instead.

	space_avail =
	    get_dfree_info(conn, fsp->fsp_name, &bsize, &dfree, &dsize);

and that ends up calling the quota queries you observed. In this
specific case, we need to override the quota query permissions, to at
least know about the quota. The way this check is done is not great
(first check for available space and create the actual file later;
somethign could happen in between), but without FL_KEEP_SIZE available,
there is not much else we could do.

If that is your scenario, you could try configuring Samba with "strict
allocate = no", to avoid this codepath. I don't think simply removing
the become_root is the correct approach here.

Christof

