Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529E3A7029
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jun 2021 22:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=h1EXaTfWtA0AMpcnbnYMSCRk8KopxDBJrnFZVP0y5oQ=; b=xfuXSNvhroS9yqfM7ui7N0PjK+
	GqC7bSzQy5Mi2LMzcGkIfqF2X+r/lENXLaScSfosJ72VQ9GCJq6LUl1BwXSBpdQrt8N3Q3485hAN6
	p4plnjq3O/v5nsDTCNbDmGiQ+W9RZS9AIbdv1FRqmXgGQuKDAvFZNQUoauwCzLyB5Si6L3y6T+s+m
	Eggpxaz9y3cetLiQ3E84Dn+DV4cGBmhVZ0T1trOTPODgml+3vnOW4x2QSpGkSZNDw9z4m7t1sg0Rv
	mgOtu/z/iC4Ad9LaPS6CSNfHtiPt92Pn3Ji+JvQeMGRcTzjsCUr3s9OmE1QuYqNGE4wiwo+BBDl6W
	dni3FQfg==;
Received: from ip6-localhost ([::1]:51572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lst4J-005aSG-HY; Mon, 14 Jun 2021 20:20:23 +0000
Received: from mail.univention.de ([82.198.197.8]:29771) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lst4A-005aS7-2s
 for samba-technical@lists.samba.org; Mon, 14 Jun 2021 20:20:20 +0000
Received: from localhost (localhost [127.0.0.1])
 by solig.knut.univention.de (Postfix) with ESMTP id CC73D13721AC4
 for <samba-technical@lists.samba.org>; Mon, 14 Jun 2021 22:04:19 +0200 (CEST)
Received: from mail.univention.de ([127.0.0.1])
 by localhost (solig.knut.univention.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4mXx0s1x2AH for <samba-technical@lists.samba.org>;
 Mon, 14 Jun 2021 22:04:18 +0200 (CEST)
Received: from braeda.localnet (p4fc05d0e.dip0.t-ipconnect.de [79.192.93.14])
 by solig.knut.univention.de (Postfix) with ESMTPSA id 440DE13721AB4
 for <samba-technical@lists.samba.org>;
 Mon, 14 Jun 2021 22:04:18 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: migrate-samldb-from-tdb-to-mdb
Date: Mon, 14 Jun 2021 22:04:13 +0200
Message-ID: <13407703.MucGe3eQFb@braeda>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4326601.GKX7oQKdZx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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
From: Arvid Requate via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arvid Requate <requate@univention.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--nextPart4326601.GKX7oQKdZx
Content-Type: multipart/mixed; boundary="nextPart8033173.1B3tZ46Xf9"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart8033173.1B3tZ46Xf9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

I've written a small script to convert the sam.ldb database backend of a=20
Samba/AD DC from TDB to LMDB. It just uses python-tdb and python-lmdb and=20
treats the key/value content uninterpreted as blobs. Maybe it's a useful=20
addition to the repository section example/scripts or I could turn it into =
a =20
subcommand of samba-tool, if anybody thinks that's a good idea.

Cheers,
Arvid

=2D-=20
Arvid Requate
Open Source Software Engineer

Univention GmbH
be open.
Mary-Somerville-Str.1
28359 Bremen
Tel. : +49 421 22232-52
=46ax : +49 421 22232-99

Gesch=C3=A4ftsf=C3=BChrer: Peter H. Ganten
HRB 20755 Amtsgericht Bremen
Steuer-Nr.: 71-597-02876
--nextPart8033173.1B3tZ46Xf9
Content-Disposition: attachment; filename="migrate-samldb-from-tdb-to-mdb"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-python; charset="UTF-8"; name="migrate-samldb-from-tdb-to-mdb"

#!/usr/bin/python
import argparse
from contextlib import contextmanager
from datetime import datetime
import ldb
import lmdb
import os
from samba import Ldb
from samba.auth import system_session
from samba.param import LoadParm
import shutil
import subprocess
import sys
import tdb
import time


# Default the mdb file size for the individual partitions to 8GB
DEFAULT_BACKEND_SIZE = 8 * 1024**3

def migrate_sam_ldb_backends_from_tdb_to_mdb(ldb_tdb_backend_dir, ldb_mdb_backend_dir):
    print("PROCESS: Migrating sam.ldb.d backend files from TDB to MDB")
    ldb_tdb_backend_files = [fn for fn in os.listdir(ldb_tdb_backend_dir) if fn.endswith(".ldb")]
    for fn in ldb_tdb_backend_files:
        t = tdb.Tdb(os.path.join(ldb_tdb_backend_dir, fn))
        mdb_env = lmdb.open(os.path.join(ldb_mdb_backend_dir, fn), map_size=DEFAULT_BACKEND_SIZE, subdir=False)
        os.chmod(mdb_env.path(), 0o600)

        with mdb_env.begin(write=True) as txn:
            for i in t:
                txn.put(i, t[i])
    print("PROCESS: Migration of sam.ldb.d backend files done")


@contextmanager
def sam_ldb_backends_from_tdb_to_mdb(lp):
    print("PROCESS: Creating new sam.ldb.d directory for Migration")
    sam_backend_dir = lp.private_path("sam.ldb.d")
    sam_tdb_backend_dir = lp.private_path("sam.ldb.tdb.d")
    sam_ldb = lp.private_path("sam.ldb")
    sam_ldb_bak = lp.private_path("sam.ldb.tdb")

    try:
        os.rename(sam_backend_dir, sam_tdb_backend_dir)
    except OSError:
        print("ERROR: An exception occurred, aborting migration")
        raise

    os.mkdir(sam_backend_dir)
    os.chmod(sam_backend_dir, 0o700)

    shutil.copy(sam_ldb, sam_ldb_bak)
    os.chmod(sam_ldb_bak, 0o600)

    migrate_sam_ldb_backends_from_tdb_to_mdb(sam_tdb_backend_dir, sam_backend_dir)

    try:
        yield
    except Exception:
        print("ERROR: An exception occurred, reverting sam.ldb.d to original state")
        shutil.rmtree(sam_backend_dir)
        os.rename(sam_tdb_backend_dir, sam_backend_dir)
        os.unlink(sam_ldb)
        os.rename(sam_ldb_bak, sam_ldb)
        raise

    print("PROCESS: Moving metadata file to new sam.ldb.d directory")
    os.rename(os.path.join(sam_tdb_backend_dir, "metadata.tdb"), os.path.join(sam_backend_dir, "metadata.tdb"))


def open_samdb_raw(lp):
    # Use options=["modules:"] to keep the attached LDB modules from loading
    samdb_path = lp.private_path("sam.ldb")
    return Ldb(url=samdb_path, session_info=system_session(),
                            lp=lp, options=["modules:"])


def activate_mdb(lp):
    print("PROCESS: Switching sam.ldb from TDB to MDB")
    samdb = open_samdb_raw(lp)

    samdb.transaction_start()
    try:
        delta = ldb.Message()
        delta.dn = ldb.Dn(samdb, "@PARTITION")
        delta["backendStore"] = \
           ldb.MessageElement("mdb",
                           ldb.FLAG_MOD_REPLACE,
                           "backendStore")
        samdb.modify(delta)

        delta = ldb.Message()
        delta.dn = ldb.Dn(samdb, "@SAMBA_DSDB")
        delta["requiredFeatures"] = \
           ldb.MessageElement("lmdbLevelOne",
                           ldb.FLAG_MOD_ADD,
                           "requiredFeatures")
        samdb.modify(delta)
    except ldb.LdbError:
        samdb.transaction_cancel()
        print("PROCESS: Switching sam.ldb from TDB to MDB failed")
        raise
    else:
        samdb.transaction_commit()
        print("PROCESS: Switching sam.ldb from TDB to MDB successful")


@contextmanager
def stopped_samba_and_s4c():
    print("PROCESS: Stopping Samba and S4-Connector")
    subprocess.call(("systemctl", "stop", "univention-s4-connector"))
    subprocess.call(("/etc/init.d/samba", "stop"))

    try:
        yield
    except Exception:
        raise

    print("PROCESS: Starting Samba and S4-Connector again")
    subprocess.call(("/etc/init.d/samba", "start"))
    time.sleep(5)
    subprocess.call(("systemctl", "start", "univention-s4-connector"))


def sam_ldb_is_using_mdb(lp):
    samdb = open_samdb_raw(lp)
    res = samdb.search(base="@PARTITION", scope=ldb.SCOPE_BASE, attrs=["backendStore"])
    return (res and "backendStore" in res[0] and str(res[0]["backendStore"]) == "mdb")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Migrate sam.ldb from TDB to MDB")
    parser.add_argument("--skip-dbcheck", action='store_true')
    args = parser.parse_args()

    lp = LoadParm()

    if sam_ldb_is_using_mdb(lp):
        print("INFO: Nothing to do, sam.ldb is already using MDB")
        sys.exit(0)

    with stopped_samba_and_s4c():
        if not args.skip_dbcheck:
            print("PROCESS: Running pre-migration check of sam.ldb database")
            if subprocess.call(("samba-tool", "dbcheck", "--cross-ncs")):
                sys.exit(1)

        t0 = datetime.now()

        with sam_ldb_backends_from_tdb_to_mdb(lp):
            activate_mdb(lp)

        duration = str(datetime.now() - t0).split('.')[:-1][0]
        print("INFO: Duration: %s" % duration)

        if not args.skip_dbcheck:
            print("PROCESS: Running post-migration check of sam.ldb database")
            if subprocess.call(("samba-tool", "dbcheck", "--cross-ncs")):
                sys.exit(1)

--nextPart8033173.1B3tZ46Xf9--

--nextPart4326601.GKX7oQKdZx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEzxtmXi4eIVe2j2uTH9EoIGRGfO4FAmDHtj0ACgkQH9EoIGRG
fO7BIBAAhpapvvBzXihqVK+gRbd7RnhrY/D4mcxnRi2et88rfJVrmTlDc9b3MNgx
jlC5r2bG8ZQLRaiM2g1lk0pv6y0ymLC2N+sRQJiLFl7Oq2PLdFa4/UP2IZ5iOSIu
RQ9COEe9HX+JF6wF8pnkokyaQ3o8chRJ9KBQ14wfBui8Uj5EbJfL5zLGCyUNg7Rf
/lMS1Zg4ljCMWYh9RZs0SXDquTN6iDJC2QHhuRKSp5XgpmlDjdperTJvb1P0VVQn
xVJNGQhkIJ7FczDGdb7o0CshnGPYSHtdl2b6Ckrt8uo5gYNhsqXLHr0kqadHmAod
JOD+1Zkqq6ssUPyzjYYPID1e+QHe5QTM6oJjCSm2+HqvHCr/hV3lbImowPlQyYRd
e87VNOHGSL309IjKrg5a1U4wMItTe8nHk/G8eI/5s0W5R53Z7gCvDnheDocggdxp
ns5HivAv0XQsJWSWpYMHLNhED8PBu3ogYJ2sGEz2Ijw1h+XFh2rCmur0HkfmdP7O
bKtqxJmo4dp1Z2wt+8NAA50ikvzQxAalZNfmj6+lNJEQ4VFmT6VC8sgrvwgn+2xH
FELu16lBRBxjyMDAwJrE8hv04c6M782ubURNKQqn2qWEb1AHSCWt7j0nDcQqtHz7
ZL2AQ6kZaQGLHVuuq2AT17QOSsYrZtCzTL/MP3CunnLjwO8MYMw=
=TFsC
-----END PGP SIGNATURE-----

--nextPart4326601.GKX7oQKdZx--




