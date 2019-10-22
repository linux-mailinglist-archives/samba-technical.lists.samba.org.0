Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02642E1396
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 10:06:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=jdSjvTdb7YhhV+yeBoGT2uoOFpXOTdsEt8mUL1v5JjU=; b=KKoj/lFzQvZI5V48E2s+EQbt0H
	/c+Rw+CnPgQNfkYwofR3Fepgp1L9PDYSqkhLdGmy0z9DAGc+rdwHnDwZiJWhGWoRZJbkhkNOJa37v
	C9uwPI5py4N8JuRYEbVvTjXHVnQVT6shkY6eFBx69kS6tJ1U4Y5OBU4h5rb5wDpbXO1AMn28Nw4up
	5f3Kynw4OeYoRcwsyot8CK2cVKS8p8fFVxyebtulnkV24oQVpCfvdP8TXHvrCuo8e5Oh7IbC8a8rA
	zFVC407WrTYyZ6tvRnrhyBiw26+KWIOZDen13hJ+HyYQeU0g5fpSLAUzsbC7Gq9pHPtsDZ33JUNXI
	t7/TZ3yw==;
Received: from localhost ([::1]:40172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNBf8-001cAL-SK; Wed, 23 Oct 2019 08:06:34 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41783) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iN2Pt-001Yeh-VC
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 22:14:18 +0000
Received: by mail-pf1-x444.google.com with SMTP id q7so11508704pfh.8
 for <samba-technical@lists.samba.org>; Tue, 22 Oct 2019 15:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=jdSjvTdb7YhhV+yeBoGT2uoOFpXOTdsEt8mUL1v5JjU=;
 b=XIkqrxaAVGv4cKdfDL9k/xAlmXBfmv2xaqBwDFkiO+RuiaJ/qx8Qv68C18O/MO1irW
 Cy3Vn+tIJxOtFj8DY52CQH0sqz1B3iiTZccOjh0yUYyHLsKbUqIOJZkP1hpBi5FJn608
 BEKbvyyNE55qhvNvrbZH2IZmNn1WRfEs8EFa630Z7qZk27nOSVksTd9wxV/XGh89QoMm
 Za0X342Laxsi4tJ3eJWdVY07aJeei3nhk9yeONMbDuwXBHxa9DmHFXabN91oSXoIjD1+
 8erSnFeO/EhdCZAlrBE7LptFLs02TiPVVGY+Laj64nj95GyisCNv2t0bm1swjOyHxZ8j
 6L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=jdSjvTdb7YhhV+yeBoGT2uoOFpXOTdsEt8mUL1v5JjU=;
 b=TVlUiGpAPl9TtBQtoVkUeqRwLEbSGtShBsuDqmu7Tt1OgxOArUx/jFEiqCMVUbpng7
 qYO2pnb2waSy8wdvUk/HxAPRw8W/8mxT3JobzZGG8cfG4mwkfshj6PWVsuZcFzDZrABF
 XQLRDaFMPpCsiTmHH1AwGAciS07Wqb/1Xd6Tsek5QCeE650UgCD34UB9FGTMVlGII+Qr
 wYH8/D/bjjkH2/Owg0wqIVQi9P7k6Xj9tZMJTm/eBz6NBq5NXYTXnRriYwJcdftGv69U
 W/9yEHZpYfNk+s94ispFDrhOIjCm6l1QruXhYjpxbGR/j1s3GJWZ1SAihcxnr64orJ/l
 8rgA==
X-Gm-Message-State: APjAAAVVVJhr/FvPlhV+Xzu9FrTAIhI7KHX25O8Y4A0rYOwonTV7NmfA
 w+OJSa2UdKCuDBAuKGKb6aWpRg==
X-Google-Smtp-Source: APXvYqyCGFGpT2C3cY7XT0d1Dal+bVUH3K7BRELFdnAX59mbUm04n1z8zWdaK4LGbMaAkUt/N9526w==
X-Received: by 2002:a17:90a:a60f:: with SMTP id
 c15mr7467310pjq.18.1571782451665; 
 Tue, 22 Oct 2019 15:14:11 -0700 (PDT)
Received: from cabot-wlan.adilger.int (S0106a84e3fe4b223.cg.shawcable.net.
 [70.77.216.213])
 by smtp.gmail.com with ESMTPSA id r24sm21302038pfh.69.2019.10.22.15.13.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Oct 2019 15:14:10 -0700 (PDT)
Message-Id: <8CE5B6E8-DCB7-4F0B-91C1-48030947F585@dilger.ca>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v14 1/5] Add flags option to get xattr method paired to
 __vfs_getxattr
Date: Tue, 22 Oct 2019 16:13:53 -0600
In-Reply-To: <20191022204453.97058-2-salyzyn@android.com>
To: Mark Salyzyn <salyzyn@android.com>
References: <20191022204453.97058-1-salyzyn@android.com>
 <20191022204453.97058-2-salyzyn@android.com>
X-Mailer: Apple Mail (2.3273)
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:06:28 +0000
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
From: Andreas Dilger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Dilger <adilger@dilger.ca>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Mike Marshall <hubcap@omnibond.com>, James Morris <jmorris@namei.org>,
 devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, CIFS <linux-cifs@vger.kernel.org>,
 Paul Moore <paul@paul-moore.com>, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 Chao Yu <chao@kernel.org>, selinux@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, reiserfs-devel@vger.kernel.org,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Miklos Szeredi <miklos@szeredi.hu>, Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Eric Paris <eparis@parisplace.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 Gao Xiang <xiang@kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical <samba-technical@lists.samba.org>,
 linux-xfs <linux-xfs@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>,
 Tejun Heo <tj@kernel.org>, linux-erofs@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 linux-mm <linux-mm@kvack.org>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
 Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
 Bharath Vedartham <linux.bhar@gmail.com>, Jann Horn <jannh@google.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, Tyler Hicks <tyhicks@canonical.com>,
 linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Oct 22, 2019, at 2:44 PM, Mark Salyzyn <salyzyn@android.com> wrote:
>=20
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:
>=20
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;
> 	const char *name;
> 	union {
> 		void *buffer;
> 		const void *value;
> 	};
> 	size_t size;
> 	int flags;
> };

As part of this change (which is touching all of the uses of these
fields anyway) it would be useful to give these structure fields a
prefix like "xga_" so that they can be easily found with tags.
Otherwise, there are so many different "dentry" and "inode" fields
in various structures that it is hard to find the right one.

> #define __USE_KERNEL_XATTR_DEFS
>=20
> -#define XATTR_CREATE	0x1	/* set value, fail if attr already =
exists */
> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does =
not exist */
> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already =
exists */
> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does =
not exist */
> +#ifdef __KERNEL__ /* following is kernel internal, colocated for =
maintenance */
> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security =
check */
> +#endif

Now that these arguments are separated out into their own structure,
rather than using "int flags" (there are a million different flags in
the kernel and easily confused) it would be immediately clear *which*
flags are used here with a named enum, like:

enum xattr_flags {
	XATTR_CREATE	=3D 0x1,	/* set value, fail if attr =
already exists */
	XATTR_REPLACE	=3D 0x2,	/* set value, fail if attr does =
not exist */
#ifdef __KERNEL__ /* following is kernel internal, colocated for =
maintenance */
	XATTR_NOSECURITY=3D 0x4,  /* get value, do not involve security =
check */
#endif
};

and use this in the struct like:

struct xattr_gs_args {
	struct dentry	*xga_dentry;
	struct inode	*xga_inode;
	const char	*xga_name;
	union {
		void		*xga_buffer;
		const void	*xga_value;
	};
	size_t		 xga_size;
	enum xattr_flags xga_flags;
};

Beyond the benefit for the reader to understand the code better, this
can also allow the compiler to warn if incorrect values are being
assigned to this field.

Cheers, Andreas






--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl2vfyEACgkQcqXauRfM
H+AxqxAAq6h17WEPF6r1UpAZIwUiPfdUH5qvEj5YwdktQwWuj4vM4AD1SnRYnDv2
erszJKsHxSS8RBP18hvIK3TC7Z1TwOPYxRcZb1KRnxX0TthhtHTNL103RmQvUvKm
8KjV2ZmRZAlgrvw09BGHJF4f4ina+Ua1AQsIg7l+6eGjBHJ3Nvjmv3M/Eca3Y9Gx
eWYOM5vlA7+eVqKpCEyQ+/EN5lhBOWA+qsQhfEyPjSns/VsVae7bWkUrZSIRHpk9
i7HCwOkDj9cmfU4iZ34JePW8dtqHfoq3ECMUvsO681CznbyWB7yDnmX+UL8OFw2s
Vj2n0fIHc/r3SJ87LF/k5JhjWaYM4rCM+1+uzXmukWQWXIU2U2vkLdAPkyibo6nq
5/Z98+GzWMwnP9esRhIM1lAf2Q0QQ/Bmmz5/2rwCEYpleEKInHDZyJ3ddSCC9mxQ
+bf/9EeqBVd7b2R8rQLNcrY9R5zewIE+NovyaCcz71H6lyQ/NwfAAlUrjXN6zjGo
aZYq3D2plzK5PnJwZrmarfiI2Qtge9h2sbFNX2dRT6oLeZNzv/rAx/8AueYIcGjb
bPlf+rGFqzCVPkUQFPYqlsa/oEqUTnmr+6p8FvKO8DJhdVZEuOn/vJZV4e903hHl
VURWEhW1Djzh/zWJVrNeOQRk+0KBXXfgvZ9nHpMRbX0xESTU+cY=
=8Giq
-----END PGP SIGNATURE-----

--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC--

