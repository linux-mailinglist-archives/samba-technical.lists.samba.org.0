Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 017371D2264
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 00:52:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cvpgBEjnR50KYhTGvfOLPFNsQAa50kLUhsIM3txpXA0=; b=uyVLqxZHAqcbIfHcV7tHanujFp
	iVuppGVirJZvRRcL18W/raAiBDkGfeWtHuYdm3QMhVJoVXyj4qptNgP20FXmyQnlBcaErMQ0u6JAn
	WVoPtpYBBnVoqOVe7D1RSlJMWpBZ8Lb3jciZ6y2Q0gZ9zDVYKUMEfVGdsd6Lvcu93dvmlBVeCfEpP
	LxpSDC2oyckFXzBCbEa50kDAsjy7wUolZn3AtmWeuSt0DoK3dhDfMkLj4Sar1chUlOPqO4xo8ViGv
	P8Al5+FPcNbSOAQ4wGD6YvLDETn6+A3+0FdH4nJfJ4/qIqC70WACfLvWkmyq9P/74iRtoqw62iNsN
	cBzrj1Hw==;
Received: from localhost ([::1]:54188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZ0E5-004Go3-DG; Wed, 13 May 2020 22:51:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59578) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ0Dz-004Gnw-UM
 for samba-technical@lists.samba.org; Wed, 13 May 2020 22:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=cvpgBEjnR50KYhTGvfOLPFNsQAa50kLUhsIM3txpXA0=; b=yhNr/2aOuu6Yg4RHmvX3wgucTs
 8y34U7QxNlMS8DF2X3VYox+udQc5gyOx9Xd3l1tuys3y/PzD8Le0ISNuqcfYv6e1wgZd8OERol6X3
 5lkZdp38Oe2o9saWvMwkGazN5WadPVjLFcCplBFiAJWy/BnJprC9wkhm/J1nJ2bJXrCuBFpWUSTlR
 6kTw6HOIhNbvCZi94lPlljhuaa2dA6PqJ40jOyR3wViGiPOFBS00ACbt4DTdIgvqZMkMZRyGI+AaE
 3gpxL4asE++x49qMxKyhfpiwqC8/yYpY76CC7mDxBi8+914s9maEBNoL1L8qsQGqewfiI1BeGLZ47
 j3w+s4FA7Awebp9Nm/XqeEy14fgSSw/WRsCtkWya0HSrI6gCzd2fCfWbT6e5yENR40bbLmQ6FjrGV
 O5vK1dyE6TRg69kUeFWdD44t0a+FItiVT4OZEDzim4J57THvf0egBCgA5/QeMnBID7AQHHaGQLbZ2
 itJ6qZTQgfFNS2z6qmbdspCL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ0Dx-0004qk-Uc; Wed, 13 May 2020 22:51:38 +0000
Date: Wed, 13 May 2020 15:51:31 -0700
To: Michael Adam <obnox@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200513225131.GG9585@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513221431.GA7185@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 14, 2020 at 12:14:31AM +0200, Michael Adam wrote:
> 
> "obey pam restrictions" was certainly set to the default, i.e.  "no".
> We used a mostly default config.
> 
> The interesting bit is that smb2.read passes with "store dos
> attributes" and the "map foobar" options set to default, and
> we see the file get execute perms. But if we explicitly set
> "map archive" to "no" (which according to the man page should
> be the effect with "store dos attributes = yes"), then the test

Turns out the man page is incorrect. See the analysis below.

> fails at source4/torture/smb2/read.c:270, expecting execute perms.
> 
> Now the test is run in samba selftest only against a share with
> the "acl_xattr" vfs module enabled. That obviously passes. with
> any "map foobar" setting.
> 
> So the question is:
> 
> - Does store "dos attributes" not completely disable "map
>   archive" as claimed in the manpage?
> 
> - Or is the disabling of "map archive" doing too much in not
>   setting the execute bit when it should? After all the call
>   to torture_smb2_testfile() in source4/torture/smb2/read.c:245
>   should create the file with SEC_RIGHTS_FILE_ALL, which should
>   include execute perms. So is the execute somehow masked away?
>   (We played with setting masks to allow all bits too, that did
>   not change anything.)
> 
> We wanted to raise it here before digging deeper since it is
> quite possible that we are missing something that is more obvious
> to some. :-)

Unmodified defaults are:

Default: map archive = yes
Default: store dos attributes = yes
Default: create mask = 0744
Default: force create mode = 0000

When creating a new file via SMB2 we set the required mode bits
via:

	unx_mode = unix_mode(conn,
				new_dos_attributes | FILE_ATTRIBUTE_ARCHIVE,
				smb_fname,
				parent_dir);

Note that FILE_ATTRIBUTE_ARCHIVE is added in by default for a create.

unix_mode() has:

	mode_t result = (S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IWGRP | S_IWOTH);

For a file (not directory) it then goes through:

------>         if (lp_map_archive(SNUM(conn)) && IS_DOS_ARCHIVE(dosmode))
------>                 result |= S_IXUSR;

Is the above a bug ? According to the man page yes. Not sure we
can change this now though...

                if (lp_map_system(SNUM(conn)) && IS_DOS_SYSTEM(dosmode))
                        result |= S_IXGRP;

                if (lp_map_hidden(SNUM(conn)) && IS_DOS_HIDDEN(dosmode))
                        result |= S_IXOTH;  

                if (dir_mode) {
                        /* Inherit 666 component of parent directory mode */
                        result |= dir_mode & (S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IWGRP | S_IWOTH);
                } else {
                        /* Apply mode mask */
                        result &= lp_create_mask(SNUM(conn));
                        /* Add in force bits */
                        result |= lp_force_create_mode(SNUM(conn));
		}

So unmodified you'll end up with:

	S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IXUSR = 0744

So "store dos attributes" doesn't by default remove the mappings.

If you explicitly set "map arhive = no" then the:

                if (lp_map_archive(SNUM(conn)) && IS_DOS_ARCHIVE(dosmode))
                        result |= S_IXUSR;

is false, so you'll end up with:

	S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR = 644

Loading vfs_acl_xattr changes defaults by the following:

        /* Ensure we have the parameters correct if we're
         * using this module. */
        DEBUG(2,("connect_acl_xattr: setting 'inherit acls = true' "
                "'dos filemode = true' and "
                "'force unknown acl user = true' for service %s\n",
                service ));

        lp_do_parameter(SNUM(handle->conn), "inherit acls", "true");
        lp_do_parameter(SNUM(handle->conn), "dos filemode", "true");
        lp_do_parameter(SNUM(handle->conn), "force unknown acl user", "true");

In addition, if config->ignore_system_acls is true it further
modifies the defaults as:

        if (config->ignore_system_acls) {
                mode_t create_mask = lp_create_mask(SNUM(handle->conn));
                char *create_mask_str = NULL;

                if ((create_mask & 0666) != 0666) {
                        create_mask |= 0666;
                        create_mask_str = talloc_asprintf(handle, "0%o",
                                                          create_mask);
                        if (create_mask_str == NULL) {
                                DBG_ERR("talloc_asprintf failed\n");
                                return -1;
                        }

                        DBG_NOTICE("setting 'create mask = %s'\n", create_mask_str);

                        lp_do_parameter (SNUM(handle->conn),
                                        "create mask", create_mask_str);

                        TALLOC_FREE(create_mask_str);
                }

                DBG_NOTICE("setting 'directory mask = 0777', "
                           "'store dos attributes = yes' and all "
                           "'map ...' options to 'no'\n");

                lp_do_parameter(SNUM(handle->conn), "directory mask", "0777");
                lp_do_parameter(SNUM(handle->conn), "map archive", "no");
                lp_do_parameter(SNUM(handle->conn), "map hidden", "no");
                lp_do_parameter(SNUM(handle->conn), "map readonly", "no");
                lp_do_parameter(SNUM(handle->conn), "map system", "no");
                lp_do_parameter(SNUM(handle->conn), "store dos attributes",
                                "yes");
        }

So as you can see, what you're seeing is what the code
actually does, if it's not exactly what the man pages
state :-(.

The "expected" behavior is up for debate, as the interactions
between all these parameters as "store dos attributes" was
added was not "designed" so much as adapted to cause the
least surprises for existing users.

Hope this helps,

Jeremy.

