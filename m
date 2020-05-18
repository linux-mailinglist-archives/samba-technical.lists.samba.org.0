Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F61D7854
	for <lists+samba-technical@lfdr.de>; Mon, 18 May 2020 14:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QLzePuQBpr4sl7Ao6GkD1MlPnbTr8myVIYs7V6Fqiuc=; b=YHXGjQfIcC9eL3tZoUezrIapZN
	jnPtVLWrvdVVDjI/UneM7fHvwG1xPrgwKRHdqMR5AMc16/DjMuvH4MPydBlF9sueh8DwxU6aZLrd4
	yM/fxZI8QFPpxToipOCcKHKbhXUsquZAzYV+uhwGNqjn/A+nW3seWiKcUd4vszmMzHhefvhS4iI45
	H/gEsryQjHATlZL2rYsPtjEAmrUF/1RRMV6GpGmd7NTkncpIVXf0QotxRGLLKkkjjXIYBkop8uFo2
	kqZx+9B8XNZel1tFfdua0OG/ZlRUnNsxUCjG5GkB2/LeqS31j7k7BVjQugR5TkRIkICHygr/jgyYM
	e9HLTWPw==;
Received: from localhost ([::1]:37944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jaehq-004t98-LD; Mon, 18 May 2020 12:17:18 +0000
Received: from latitanza.investici.org ([2001:888:2000:56::19]:38435) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jaehj-004t8r-Op
 for samba-technical@lists.samba.org; Mon, 18 May 2020 12:17:14 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 13A5112188B;
 Mon, 18 May 2020 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1589804227;
 bh=QLzePuQBpr4sl7Ao6GkD1MlPnbTr8myVIYs7V6Fqiuc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jYVJU+AvQmsqRBFg7Q9nErIHNo8mxZ1d6HrPo8PTGusEOq5kt6trZuOJ9OQb7iUZx
 AupDgO5a18lypFmn5wLHwHTlgwm3+xQQ2eoISedyHR5/itgwlLYYolqpxyiZ2zGxML
 T5iy1EZzDU3/845H8qWWDpI6Y3JlDWcjBl0VftSs=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 20C35120184; Mon, 18 May 2020 12:17:04 +0000 (UTC)
Message-ID: <0ea0253023c276aedf3b2eb162a9907cdcf08092.camel@cryptolab.net>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
To: Jeremy Allison <jra@samba.org>, Michael Adam <obnox@samba.org>
Date: Mon, 18 May 2020 17:47:00 +0530
In-Reply-To: <20200515004712.GA30423@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer> <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer> <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer> <20200514075904.GA150211@samba.org>
 <20200514174533.GC13942@jeremy-acer> <20200514232614.GA483587@samba.org>
 <20200515004712.GA30423@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-05-14 at 17:47 -0700, Jeremy Allison via samba-technical
wrote:
> On Fri, May 15, 2020 at 01:26:14AM +0200, Michael Adam wrote:
> > If I disable acl_xattr but set "inherit acls = yes", this still
> > fails the same way. Only acl_xattr sets the execute perms.
> > So at least it is not "inherit acls" alone.
> 
> You'll probably have to add extra DEBUG statements
> to see what is happening step by step.

Seems like we have two different mapping methods.

When vfs_acl_xattr is used along with 'ignore system acls' we have
special kind of treatment as follows inside make_default_acl_posix():

if (mode & S_IRUSR) {
        if (mode & S_IWUSR) {
                access_mask |= SEC_RIGHTS_FILE_ALL;
        } else {
                access_mask |= SEC_RIGHTS_FILE_READ | SEC_FILE_EXECUTE;
        }
}
if (mode & S_IWUSR) {
        access_mask |= SEC_RIGHTS_FILE_WRITE | SEC_STD_DELETE;
}

This might be the reason why smb2.read.position is always passing with
vfs_acl_xattr + "ignore system acls = yes".  

> > At this point I'm mostly trying to understand.
> > I still have the impression that the behavior is somewhat
> > inconsistent and random.
> 
> Yes. It isn't to a spec and there's no comprehensive
> test. Adding such things would be good.
> 
> > And it seems to me that the test was not written to pass against
> > exactly the configuration of the tmp share in the test env, with
> > the awareness that it fails against other standard configurations.
> > I can't help the impression that this is somewhat accidential.
> 
> Yep.
> 
> > That is apparently only true for creating new files.  For opening
> > existing files however, the desired access mode seems to have a
> > lot to with the ACL on the file. So this is strangely asymmetric:
> 
> No, that's only to do with what you're allowed after
> the existing ACL is read and compared with what you're
> asking or in access_mask.

Here comes the default mapping method, invoked all the way from
smbd_check_access_rights() we have the following in
map_canon_ace_perms():

if (directory_ace) {
        nt_mask |= ((perms & S_IRUSR) ? UNIX_DIRECTORY_ACCESS_R : 0 );
        nt_mask |= ((perms & S_IWUSR) ? UNIX_DIRECTORY_ACCESS_W : 0 );
        nt_mask |= ((perms & S_IXUSR) ? UNIX_DIRECTORY_ACCESS_X : 0 );
} else {
        nt_mask |= ((perms & S_IRUSR) ? UNIX_ACCESS_R : 0 );
        nt_mask |= ((perms & S_IWUSR) ? UNIX_ACCESS_W : 0 );
        nt_mask |= ((perms & S_IXUSR) ? UNIX_ACCESS_X : 0 );
}

Thus an existing file created without 'x' bit will end up with a
access_mask without SEC_FILE_EXECUTE.

> > (1) We create a file requesting SEC_FILE_EXECUTE.
> >     The file gets created without any execut perms.
> >     (without acl_xattr and with map archive = no)
> >     The create call succees.
> > 
> > (2) Later open of the existing file also requesting
> >     SEC_FILE_EXECUTE fails.

This is because we never go through smbd_check_access_rights() if file
is being created i.e, not existing. So first time it passes and fails
from next time onwards. At least we have fixed[1] smb2.read.position to
start with fresh file.

[1] 
https://git.samba.org/?p=samba.git;a=commit;h=dbfc197f65f28c7f4e889045d7b04c46c4f6680d

> > If I do acl_xattr or map archive = yes though, then #1 also
> > creates execute bits on the file. And #2 succeeds.
> 
> Yes, but that's nothing to do with what you're asking for.
> That's to do with the config settings - not "requesting
> SEC_FILE_EXECUTE". I think :-).

Difference in behaviour is because of different mapping methods
resulting in different access_mask when used with and without
vfs_acl_xattr. Why is it so? Why shouldn't vfs_acl_xattr just deal with
setting "security.NTACL" with a value obtained out of a common mapping
method?


